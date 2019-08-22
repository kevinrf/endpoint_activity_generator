require_relative '../activity'

class DeleteFile < Activity
  def initialize(path)
    @path = path
  end

  def perform
    File.delete(@path)
  end
end
