package 'httpd' do
  action :install
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  variables(:name => 'Santosh')
  action :create
  notifies :restart, 'service[httpd]', :immediately
end

service 'httpd' do
  action [:enable, :start]
#  subscribes :restart, 'template[/var/www/html/index.html]', :immediately
end
