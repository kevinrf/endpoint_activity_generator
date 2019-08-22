class ScenarioRunner
  def initialize(log: nil)
    @log = log
  end

  def run(scenario)
    scenario.each do |activity|
      activity.perform
      @log.append({activity: activity.activity_name}) if @log
    end
  end
end
