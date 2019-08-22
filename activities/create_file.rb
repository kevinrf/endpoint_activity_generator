require_relative '../activity'

class CreateFile
  extend Activity

  def initialize(path)
    @path = path
  end

  def perform
    File.open(@path, 'w') {}
  end
end
