require_relative '../activity'

class ModifyFile < Activity
  def initialize(path, append_data: nil)
    @path = File.expand_path(path)
    @append_data = append_data
  end

  def perform
    raise "File does not yet exist: #{@path}" unless File.exist?(@path)

    File.open(@path, 'a') do |f|
      f.write(@append_data)
    end
  end

  def log_data
    {path: @path}
  end
end
