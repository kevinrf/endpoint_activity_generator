require 'date'

class ScenarioRunner
  def initialize(log: nil)
    @log = log
  end

  def run(scenario)
    scenario.each do |activity|
      activity.perform
      next unless @log

      event = {
        activity: activity.class.activity_name,
        timestamp: DateTime.now.iso8601,
      }.merge!(activity.log_data)
      @log.append(event)
    end
  end
end
