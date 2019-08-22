module Pretty
  def self.format(event)
    values = event.dup.tap do |h|
      h.delete(:timestamp)
      h.delete(:activity)
    end
    value_string = values.each_pair.collect { |k, v| "#{k}=#{v}" }.join(', ')

    "#{event[:timestamp]} #{event[:activity]} (#{value_string})\n"
  end
end
