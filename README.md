# FluentD Plugin - Drop By Timestamp

Fluentd plugin for dropping records by timestamp

## Usage

Copy plugin to fluentd plagins dir

```bash
cp lib/fluent/plugin/fluentd_plugin_drop_by_timestamp.rb /etc/fluent/plugin/
```

Define filter in `fluent.conf`

```ruby
<filter **_default_** **_kube-*_** **_openshift-*_** **_openshift_** journal.** system.var.log** **.openshift_** **.openshift-*_** **.default_** **.kube-*_**>
  @type drop_by_timestamp
  timestamp_ttl_sec 86400 # drop records older than 24h
  timestamp_field "@timestamp"
</filter>
```

## Todo

* add tests
* publish on rubygems.org

## License

FluentD Plugin - Drop By Timestamp is licenced under the Apache License Version 2.0. See the [LICENSE](https://github.com/anisimovdk/fluentd-plugin-drop-by-timestamp/blob/master/LICENSE) file for details.
