require_relative 'scenario_builder'
require_relative 'scenario_runner'
require_relative 'log'
require_relative 'log_format/pretty'
require_relative 'activity'
require_relative 'activities/create_file'
require_relative 'activities/modify_file'

SCENARIO_PATH = './scenarios/default.rb'

ObjectSpace.each_object(Class).select { |c| c < Activity }.each do |c|
  ScenarioBuilder.register_activity_class(c)
end
scenario_builder = ScenarioBuilder.new
scenario_builder.instance_eval(File.read(SCENARIO_PATH), SCENARIO_PATH)
scenario = scenario_builder.activities
logger = Log.new(out: $stdout, formatter: Pretty)
scenario_runner = ScenarioRunner.new(log: logger)
scenario_runner.run(scenario)
