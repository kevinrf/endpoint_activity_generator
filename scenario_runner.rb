class ScenarioRunner
  def initialize(log: nil)
    @log = log
  end

  def run(scenario)
    scenario.each do |activity|
      activity.perform
      if @log
        event = {activity: activity.activity_name}.merge!(activity.log_data)
        @log.append(event)
      end
    end
  end
end
