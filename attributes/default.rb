# Cookbook Name:: logrotate
# Attributes:: default

default['logrotate']['default']['frequency']           = 'weekly'
default['logrotate']['default']['rotation_limit']      = 30
default['logrotate']['default']['creating_log']        = '0660 root utmp'
default['logrotate']['default']['allow_missing_log']   = true
default['logrotate']['default']['compress']            = true
default['logrotate']['default']['delay_compress']      = true
default['logrotate']['default']['deny_empty_rotation'] = false
default['logrotate']['default']['moving_log']          = false
default['logrotate']['default']['copy']                = false
default['logrotate']['default']['truncate_copy']       = false
default['logrotate']['default']['triggered_log_size']  = false
default['logrotate']['default']['first_action']        = false
default['logrotate']['default']['prerotate']           = false
default['logrotate']['default']['postrotate']          = false
default['logrotate']['default']['last_action']         = false
default['logrotate']['rotations']                      = {}
