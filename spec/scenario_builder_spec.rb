require_relative '../scenario_builder'
require_relative '../activity'

describe ScenarioBuilder do
  describe '.register_activity_class' do
    it 'creates an instance method for the activity' do
      ScenarioBuilder.register_activity_class(TestActivity)
      expect(ScenarioBuilder.new).to respond_to(:test_activity)
    end
  end

  describe '#<activity_method>' do
    it 'instantiates the underlying activity class with given parameters' do
      expect(TestActivity).to receive(:new).with(1, {bar: 2})
      ScenarioBuilder.register_activity_class(TestActivity)
      ScenarioBuilder.new.test_activity(1, {bar: 2})
    end

    it 'adds the activity to the scenario' do
      ScenarioBuilder.register_activity_class(TestActivity)
      scenario = ScenarioBuilder.new
      scenario.test_activity(1, {bar: 2})
      expect(scenario.activities).to contain_exactly(be_a(TestActivity))
    end
  end
end

class TestActivity < Activity
  def initialize(foo, bar:); end
  def perform; end
end
