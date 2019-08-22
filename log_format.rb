Dir['./log_format/*.rb'].each { |file| require file }

module LogFormat
  def self.for_name(format_name)
    constant_name = format_name.to_s.split('_').map(&:capitalize).join('')
    const_get(constant_name)
  end
end
