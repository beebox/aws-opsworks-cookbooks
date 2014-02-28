# write template file

template 'apache2.conf' do
  case node[:platform]
  when 'centos','redhat','fedora','amazon'
    path "#{node[:apache][:dir]}/conf/httpd.conf"
  when 'debian','ubuntu'
    path "#{node[:apache][:dir]}/apache2.conf"
  end
  source 'apache2.conf.erb'
  owner 'root'
  group 'root'
  mode 0644
  # notifies :run, resources(:bash => 'logdir_existence_and_restart_apache2')
end


# restart apache

service "httpd" do
  supports :restart => true, :reload => true
  action :restart
end