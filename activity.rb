# extend this to register new activities
module Activity
  def log_data
    {}
  end

  def activity_name
    name.dup.gsub!(/(.)([A-Z])/, '\1_\2').downcase!
  end
end
