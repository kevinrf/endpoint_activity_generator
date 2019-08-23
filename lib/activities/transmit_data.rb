require 'socket'

class TransmitData < Activity
  def initialize(host, port, data: '')
    @host = host
    @port = port
    @data = data
  end

  def perform
    TCPSocket.open(@host, @port) do |socket|
      @bytes_sent = socket.write(@data)
    end
  end

  def log_data
    {bytes_sent: @bytes_sent || 0}
  end
end
