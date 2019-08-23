require 'optparse'
require_relative 'activity'
require_relative 'context'
require_relative 'log'
require_relative 'log_format'
require_relative 'scenario_builder'
require_relative 'scenario_runner'

context = Context.resolve

options = {
  log_format: :pretty,
  output: $stdout,
}

optparse = OptionParser.new do |opts|
  opts.on('-f', '--file FILE', 'Scenario file to run.') do |f|
    options[:file] = f
  end

  opts.on('-l', '--log-format FORMAT',
          'Log formatter to use (e.g. \'json\').') do |lf|
    options[:log_format] = lf
  end

  opts.on('-h', '--help', 'Show this message.') do
    puts opts
    exit
  end

  opts.on('-o', '--output OUTPUT',
          'Log file destination. If not present, logs are printed to STDOUT.') do |o|
    options[:output] = File.open(o, 'w')
  end
end

optparse.parse!

unless options[:file]
  puts 'Missing option: file'
  puts optparse
  exit
end

ObjectSpace.each_object(Class).select { |c| c < Activity }.each do |c|
  ScenarioBuilder.register_activity_class(c)
end
scenario_builder = ScenarioBuilder.new
scenario_builder.instance_eval(File.read(options[:file]), options[:file])
scenario = scenario_builder.activities
logger = Log.new(
  out: options[:output],
  context: context,
  formatter: LogFormat.for_name(options[:log_format])
)
scenario_runner = ScenarioRunner.new(log: logger)
scenario_runner.run(scenario)
