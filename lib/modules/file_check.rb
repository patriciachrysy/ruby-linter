require_relative './check_global_syntax_helper'
require_relative './preference_helper'
require_relative '../error'

module FileCheck
  def self.check_file(errors, file)
    res = CheckGlobalSyntaxHelper.check_open_end(file)
    errors << res if res
    res = PreferenceHelper.check_module(file)
    errors << res if res
    errors
  end

  def self.file_exist(path)
    File.exist?(path) ? true : "Could not find #{path} file"
  end

  def self.dir_exist(path)
    Dir.exist?(path) ? true : "Could not find #{path} directory"
  end

  def self.content_ruby_files(path = nil)
    if path
      files = Dir["#{path}/**/*.rb"]
      files.empty? ? files : "No ruby files found in #{path} directory"
    else
      files = Dir['./**/*.rb']
      files.empty? ? files : 'No ruby files found in this directory'
    end
  end
end
