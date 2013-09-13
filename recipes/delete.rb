# Cookbook Name:: logrotate
# Recipe:: delete

Array(node['logrotate']['delete_rotations']).each do |name, params|
  logrotate name do
    action :delete
  end
end
