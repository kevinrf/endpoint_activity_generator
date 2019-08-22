require 'pp'
require 'fakefs/spec_helpers'
require_relative '../../activities/create_file'

describe CreateFile do
  include FakeFS::SpecHelpers

  describe '#perform' do
    it 'creates a new file at the specified path' do
      file_path = './tempfile.txt'
      CreateFile.new(file_path).perform
      expect(File.exist?(file_path)).to be true
    end
  end

  it 'extends Activity' do
    expect(CreateFile).to be < Activity
  end
end
