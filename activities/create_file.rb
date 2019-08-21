class CreateFile
  def initialize(path)
    @path = path
  end

  def perform
    File.open(@path, 'w') {}
  end
end
