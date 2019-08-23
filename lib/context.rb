require 'etc'

module Context
  def self.resolve
    {
      pid: Process.pid,
      process: Process.argv0,
      cmd: "#{$PROGRAM_NAME} #{ARGV.join(' ')}".strip,
      user: Etc.getlogin,
    }
  end
end
