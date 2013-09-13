# Cookbook Name:: logrotate
# Recipe:: default

package 'logrotate' do
  action :upgrade
end

Array(node['logrotate']['rotations']).each do |name, params|
  logrotate name do
    action :create

    log_paths params[:log_paths]
    frequency params[:frequency]                     || node['logrotate']['default']['frequency']
    rotation_limit params[:rotation_limit]           || node['logrotate']['default']['rotation_limit']
    creating_log params[:creating_log]               || node['logrotate']['default']['creating_log']
    allow_missing_log params[:allow_missing_log]     || node['logrotate']['default']['allow_missing_log']
    compress params[:compress]                       || node['logrotate']['default']['compress']
    delay_compress params[:delay_compress]           || node['logrotate']['default']['delay_compress']
    deny_empty_rotation params[:deny_empty_rotation] || node['logrotate']['default']['deny_empty_rotation']
    moving_log params[:moving_log]                   || node['logrotate']['default']['moving_log']
    date_ext params[:date_ext]                       || node['logrotate']['default']['date_ext']
    copy params[:copy]                               || node['logrotate']['default']['copy']
    truncate_copy params[:truncate_copy]             || node['logrotate']['default']['truncate_copy']
    triggered_log_size params[:triggered_log_size]   || node['logrotate']['default']['triggered_log_size']
    first_action params[:first_action]               || node['logrotate']['default']['first_action']
    prerotate params[:prerotate]                     || node['logrotate']['default']['prerotate']
    postrotate params[:postrotate]                   || node['logrotate']['default']['postrotate']
    last_action params[:last_action]                 || node['logrotate']['default']['last_action']
  end
end
