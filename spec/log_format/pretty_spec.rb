require_relative '../../log_format/pretty'

describe LogFormat::Pretty do
  describe '.format' do
    it 'converts the event map to a formatted string' do
      event = {
        timestamp: '2019-08-21T21:06',
        activity: :foo,
        bar: 1,
        baz: 2
      }
      expect(LogFormat::Pretty.format(event)).to eql(
        "2019-08-21T21:06 foo (bar=1, baz=2)\n"
      )
    end
  end
end
