class ScenarioBuilder
  attr_reader :activities

  def initialize
    @activities = []
  end

  def self.register_activity_class(activity_class)
    define_method(activity_class.activity_name) do |*args|
      @activities << activity_class.new(*args)
    end
  end
end
