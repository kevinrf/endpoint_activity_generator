require 'json'

module LogFormat

  # newline-separated JSON
  module Json
    def self.format(event)
      "#{event.to_json}\n"
    end
  end
end
