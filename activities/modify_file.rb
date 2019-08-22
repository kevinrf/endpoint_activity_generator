require 'fileutils'
require_relative '../activity'

class ModifyFile
  extend Activity

  def initialize(path)
    @path = path
  end

  def perform
    raise "File does not yet exist: #{@path}" unless File.exist?(@path)

    FileUtils.touch(@path)
  end
end
