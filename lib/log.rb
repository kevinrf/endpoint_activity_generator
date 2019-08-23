class Log
  def initialize(out:, formatter:, context: {})
    @out = out
    @formatter = formatter
    @context = context
  end

  def append(event)
    @out << @formatter.format(event.merge(@context))
  end
end
