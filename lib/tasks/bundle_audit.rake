task :bundle_audit do
  unless system('bundle-audit')
    exit 1
  end
end
