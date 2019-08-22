require 'pp'
require 'fakefs/spec_helpers'
require_relative '../../activities/modify_file'

describe ModifyFile do
  include FakeFS::SpecHelpers

  describe '#perform' do
    context 'when the specified file does not exist' do
      it 'raises an error' do
        expect { ModifyFile.new('tmp.txt').perform }.to raise_error RuntimeError
      end
    end

    context 'when the specified file exists' do
      file_path = './tempfile.txt'.freeze

      before do
        File.open(file_path, 'w') {}
      end

      it 'modifies the file' do
        original_modified_time = File.mtime(file_path)
        ModifyFile.new(file_path).perform
        expect(File.mtime(file_path)).to be > original_modified_time
      end
    end
  end

  it 'extends Activity' do
    expect(ModifyFile).to be_an(Activity)
  end
end
