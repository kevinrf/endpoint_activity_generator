class RunProcess < Activity
  def initialize(cmd, args = nil)
    @cmd = cmd
    @args = args
  end

  def perform
    @child_pid = @args ? Process.spawn(@cmd, @args) : Process.spawn(@cmd)
  end

  def log_data
    {
      child_pid: @child_pid,
      child_cmd: @cmd,
      child_args: @args,
    }
  end
end
