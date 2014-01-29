task :whitespace do
  puts 'Checking for whitespace errors'
  file_glob = '{app,bin,config,db,doc,lib,spec}/**/*'
  unless system("git --no-pager diff --check origin/master -- #{file_glob}")
    exit 1
  end
end
