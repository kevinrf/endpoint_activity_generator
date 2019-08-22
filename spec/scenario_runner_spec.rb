require_relative '../scenario_runner'
require_relative '../activity'
require_relative '../log'
require_relative '../log_format/raw'

describe ScenarioRunner do
  describe '#run' do
    let(:test_activity_class) do
      Class.new(Activity) do
        def perform; end

        def log_data
          {}
        end

        def self.activity_name
          'test_activity'
        end
      end
    end

    it 'performs all activities in the scenario' do
      scenario = [test_activity_class.new, test_activity_class.new]
      expect(scenario).to all(receive(:perform))
      ScenarioRunner.new.run(scenario)
    end

    it 'logs all activities performed' do
      logged_events = []
      logger = Log.new(out: logged_events, formatter: Raw)
      scenario = [test_activity_class.new, test_activity_class.new]
      scenario_runner = ScenarioRunner.new(log: logger)
      scenario_runner.run(scenario)
      expect(logged_events).to contain_exactly(
        a_hash_including(activity: 'test_activity', timestamp: be_a(String)),
        a_hash_including(activity: 'test_activity', timestamp: be_a(String))
      )
    end

    it 'includes any data from Activity#log_data in the log statements' do
      test_activity_class.define_method(:log_data) do
        {additional_data: 'foobar'}
      end
      logged_events = []
      logger = Log.new(out: logged_events, formatter: Raw)
      scenario = [test_activity_class.new]
      scenario_runner = ScenarioRunner.new(log: logger)
      scenario_runner.run(scenario)
      expect(logged_events).to contain_exactly(
        a_hash_including(activity: 'test_activity', additional_data: 'foobar')
      )
    end
  end
end
