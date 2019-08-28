require 'socket'

class TransmitData < Activity
  def initialize(host, port, data: '')
    @host = host
    @port = port
    @data = data
  end

  def perform
    TCPSocket.open(@host, @port) do |socket|
      _, @local_port, @local_ip = socket.addr
      _, @remote_port, @remote_ip = socket.peeraddr
      @bytes_sent = socket.write(@data)
    end
  end

  def log_data
    {
      remote_ip: @remote_ip,
      remote_port: @remote_port,
      local_ip: @local_ip,
      local_port: @local_port,
      bytes_sent: @bytes_sent || 0,
    }
  end
end
