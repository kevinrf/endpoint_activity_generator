require 'pp'
require 'fakefs/spec_helpers'
require_relative '../../lib/activities/delete_file'

describe DeleteFile do
  include FakeFS::SpecHelpers

  describe '#perform' do
    context 'when the specified file does not exist' do
      it 'raises an error' do
        expect { DeleteFile.new('tmp.txt').perform }.to raise_error Errno::ENOENT
      end
    end

    context 'when the specified file exists' do
      file_path = './tempfile.txt'.freeze

      before do
        File.open(file_path, 'w') {}
      end

      it 'deletes the file' do
        DeleteFile.new(file_path).perform
        expect(File.exist?(file_path)).to be false
      end
    end
  end

  describe '#log_data' do
    it 'includes the target absolute path' do
      file_path = './tempfile.txt'
      expect(DeleteFile.new(file_path).log_data).to include(
        path: File.expand_path(file_path)
      )
    end
  end

  it 'extends Activity' do
    expect(DeleteFile).to be < Activity
  end
end
