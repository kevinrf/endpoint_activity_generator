require_relative '../log_format'

describe LogFormat do
  describe '.for_name' do
    context 'when a formatter with the specified name exists' do
      it 'returns the formatter' do
        expect(LogFormat.for_name(:raw)).to be LogFormat::Raw
      end
    end
  end
end
