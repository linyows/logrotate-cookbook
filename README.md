Logrotate Cookbook
==================

This cookbook makes logrotate.

Attributes
----------

#### logrotate::default

Key       | Description       | Default
---       | -----------       | -------
rotations | rotations         | {}
default   | generics settings | {}

Usage
-----

Role based logrotate example:

```ruby
run_list(
  'recipe[logrotate]'
)

override_attributes(
  :logrotate => {
    :frequency => 'daily',
    :rotation_limit => 60,
    :creating_log =>'0660 root utmp',
    :delay_compress => true,
    :date_ext => true,
    :rotations => {
      :app_production => {
        :log_paths => '/var/www/deploys/rails_app/shared/log/*.log',
        :last_action => <<-CMD.gsub(/\s+/, ' ')
          pid=/var/www/deploys/rails_app/shared/pids/unicorn.pid;
          test -s $pid && kill -USR1 "$(cat $pid)"
        CMD
      },
      :app_staging => {
        :log_paths => '/var/www/deploys/rails_app_staging/shared/log/*.log',
        :last_action => <<-CMD.gsub(/\s+/, ' ')
          pid=/var/www/deploys/rails_app/shared/pids/unicorn.pid;
          test -s $pid && kill -USR1 "$(cat $pid)"
        CMD
      }
    }
  }
)
```

License and Authors
-------------------

MIT license
