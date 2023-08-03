require 'fluent/plugin/filter'

module Fluent::Plugin
  class DropByTimestamp < Filter

    Fluent::Plugin.register_filter('drop_by_timestamp', self)

    config_param :timestamp_ttl_sec, :string, default: '86400'
    config_param :timestamp_field, :string, default: '@timestamp'

    def configure(conf)
      super
      require 'date'
      @strftime_format = "%Y-%m-%dT%H:%M:%S.%3N%z".freeze
      raise Fluent::ConfigError, "timestamp_ttl_sec can not be empty" if timestamp_ttl_sec.empty?
      raise Fluent::ConfigError, "timestamp_field can not be empty" if timestamp_field.empty?
    end

    def start
      super
    end

    def shutdown
      super
    end

    def filter(tag, time, record)
      begin
        if !record[@timestamp_field].to_s.empty?
          @time_ttl_sec = Time.now.to_i - @timestamp_ttl_sec.to_i
          if Time.parse("#{record[@timestamp_field]}").to_i < @time_ttl_sec
            $log.debug("Drop record with old timestamp: '#{Time.parse("#{record[@timestamp_field]}").strftime(@strftime_format)}' is older than #{@timestamp_ttl_sec}sec ('#{Time.at(@time_ttl_sec).strftime(@strftime_format)}')")
            return nil
          end
        end
      rescue => e
        log.warn "failed to drop events", error: e
        log.warn_backtrace
      end
      record
    end
  end
end

