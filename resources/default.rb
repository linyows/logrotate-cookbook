# Cookbook Name:: logrotate
# Resource:: default

actions :create, :delete
default_action :create

def initialize(*args)
  super
  @action = :create
end

attribute :name,
  :name_attribute => true,
  :kind_of => String,
  :required => true
attribute :log_paths,
  :kind_of => [String, Array],
  :required => true
attribute :frequency,
  :kind_of => String,
  :equal_to => ['weekly', 'daily', 'monthly'],
  :default => 'weekly'
attribute :rotation_limit,
  :kind_of => Integer,
  :default => 30
attribute :creating_log,
  :kind_of => [String, FalseClass],
  :default => '0660 root utmp'
attribute :allow_missing_log,
  :kind_of => [TrueClass, FalseClass],
  :default => true
attribute :compress,
  :kind_of => [TrueClass, FalseClass],
  :default => true
attribute :delay_compress,
  :kind_of => [TrueClass, FalseClass],
  :default => true
attribute :deny_empty_rotation,
  :kind_of => [TrueClass, FalseClass],
  :default => false
attribute :moving_log,
  :kind_of => [String, FalseClass],
  :default => false
attribute :date_ext,
  :kind_of => [TrueClass, FalseClass],
  :default => false
attribute :copy,
  :kind_of => [TrueClass, FalseClass],
  :default => false
attribute :truncate_copy,
  :kind_of => [TrueClass, FalseClass],
  :default => false
attribute :triggered_log_size,
  :kind_of => [String, FalseClass],
  :default => false
attribute :first_action,
  :kind_of => [String, FalseClass],
  :default => false
attribute :prerotate,
  :kind_of => [String, FalseClass],
  :default => false
attribute :postrotate,
  :kind_of => [String, FalseClass],
  :default => false
attribute :last_action,
  :kind_of => [String, FalseClass],
  :default => false
