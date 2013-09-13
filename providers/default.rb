# Cookbook Name:: logrotate
# Provider:: default

def whyrun_supported?
  true
end

action :create do
  converge_by "Create #{new_resource}" do
    r = template "/etc/logrotate.d/#{new_resource.name}" do
      source 'logrotate.erb'
      cookbook 'logrotate'
      mode 0644
      owner 'root'
      group 'root'
      variables new_resource.to_hash
    end

    new_resource.updated_by_last_action(r.updated_by_last_action?)
  end
end

action :delete do
  converge_by "Delete #{new_resource}" do
    execute "rm /etc/logrotate.d/#{new_resource.name}" do
      only_if FileTest.exists?("/etc/logrotate.d/#{new_resource.name}")
      command "rm /etc/logrotate.d/#{params[:name]}"
    end

    new_resource.updated_by_last_action(true)
  end
end
