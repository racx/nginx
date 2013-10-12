rtmp_repo_url = node['nginx']['rtmp']['git']
rtmp_source_path = "#{Chef::Config['file_cache_path']}/nginx_rtmp_module"

git rtmp_source_path do
   repository rtmp_repo_url
   reference node['nginx']['rtmp']['git_revision']
   action :sync
   user "root"
   group "root"
end


node.run_state['nginx_configure_flags'] =
    node.run_state['nginx_configure_flags'] | ["--add-module=#{rtmp_source_path}"]
