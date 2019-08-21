require_relative '../log'

describe Log do
  describe '#append' do
    it 'logs the event to the output stream' do
      output = []
      log = Log.new(out: output, formatter: NoOpFormatter)
      event = {foo: 'bar'}
      log.append(event)
      expect(output).to contain_exactly(a_hash_including(event))
    end

    it 'includes context data in the log entry' do
      output = []
      context = {baz: 'qux'}
      log = Log.new(out: output, context: context, formatter: NoOpFormatter)
      event = {foo: 'bar'}
      log.append(event)
      expect(output).to contain_exactly(a_hash_including(context))
    end

    it 'formats the log entry with the given formatter' do
      output = []
      log = Log.new(out: output, formatter: TestFlagFormatter)
      event = {foo: 'bar'}
      log.append(event)
      expect(output).to contain_exactly(a_hash_including(:test_flag))
    end
  end
end

module NoOpFormatter
  def self.format(event)
    event
  end
end

module TestFlagFormatter
  def self.format(event)
    event.merge({test_flag: ''})
  end
end
