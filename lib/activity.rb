# subclass this to register new activities
class Activity
  def log_data
    {}
  end

  def self.activity_name
    name.dup.gsub!(/(.)([A-Z])/, '\1_\2').downcase!
  end
end

Dir['./lib/activities/*.rb'].each { |file| require file }
