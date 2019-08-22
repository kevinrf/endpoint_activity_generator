require_relative '../activity'

class CreateFile < Activity
  def initialize(path)
    @path = path
  end

  def perform
    File.open(@path, 'w') {}
  end

  def log_data
    {path: @path}
  end
end
