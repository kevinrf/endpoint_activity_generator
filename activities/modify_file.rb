require 'fileutils'
require_relative '../activity'

class ModifyFile < Activity
  def initialize(path)
    @path = path
  end

  def perform
    raise "File does not yet exist: #{@path}" unless File.exist?(@path)

    FileUtils.touch(@path)
  end

  def log_data
    {path: @path}
  end
end
