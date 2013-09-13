# Cookbook Name:: logrotate
# Recipe:: default

package 'logrotate' do
  action :upgrade
end

Array(node['logrotate']['rotations']).each do |name, params|
  logrotate name do
    action :create

    log_paths params[:log_paths]
    frequency (params[:frequency] || node['logrotate']['frequency'])
    rotation_limit (params[:rotation_limit] || node['logrotate']['rotation_limit'])
    creating_log (params[:creating_log] || node['logrotate']['creating_log'])
    allow_missing_log (params[:allow_missing_log] || node['logrotate']['allow_missing_log'])
    compress (params[:compress] || node['logrotate']['compress'])
    delay_compress (params[:delay_compress] || node['logrotate']['delay_compress'])
    deny_empty_rotation (params[:deny_empty_rotation] || node['logrotate']['deny_empty_rotation'])
    moving_log (params[:moving_log] || node['logrotate']['moving_log'])
    date_ext (params[:date_ext] || node['logrotate']['date_ext'])
    copy (params[:copy] || node['logrotate']['copy'])
    truncate_copy (params[:truncate_copy] || node['logrotate']['truncate_copy'])
    triggered_log_size (params[:triggered_log_size] || node['logrotate']['triggered_log_size'])
    first_action (params[:first_action] || node['logrotate']['first_action'])
    prerotate (params[:prerotate] || node['logrotate']['prerotate'])
    postrotate (params[:postrotate]  || node['logrotate']['postrotate'])
    last_action (params[:last_action]  || node['logrotate']['last_action'])
  end
end
