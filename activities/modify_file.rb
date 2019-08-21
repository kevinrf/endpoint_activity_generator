require 'fileutils'

class ModifyFile
  def initialize(path)
    @path = path
  end

  def perform
    raise "File does not yet exist: #{@path}" unless File.exist?(@path)

    FileUtils.touch(@path)
  end
end
