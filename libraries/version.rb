class Chef::Recipe
  def marker_version_string_for(application_name)
    application_name + "-" + version_string_for(application_name)
  end

  def version_string_for(application_name)
    node['apps'][application_name]['version'] || raise("you must define a version for #{application_name} in attributes.")
  end

  def checksum_string_for(application_name)
    node['apps'][application_name]['checksum'] || raise("you must define a checksum for #{application_name} in attributes.")
  end
end