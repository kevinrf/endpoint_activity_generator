require_relative '../activity'

class CreateFile < Activity
  def initialize(path)
    @path = File.expand_path(path)
  end

  def perform
    @file = File.open(@path, 'w') {}
  end

  def log_data
    {path: @path}
  end
end
