script "install_something" do
  interpreter "bash"
  user "ec2"
  cwd "/home/ec2-user"
  code <<-EOH
    ls -l > script_test.log
  EOH
end
