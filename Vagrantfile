# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = 'Ubuntu_12.04-Chef_11.4.4'
  config.vm.box_url = 'http://goo.gl/np92o'
  config.vm.hostname = 'logrotate'

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = %w(cookbooks)
    chef.add_recipe 'logrotate'
    chef.json = {
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
    }
  end
end
