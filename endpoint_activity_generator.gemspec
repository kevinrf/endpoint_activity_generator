Gem::Specification.new do |s|
  s.name        = 'endpoint_activity_generator'
  s.version     = '1.0.0'
  s.date        = '2019-08-22'
  s.summary     = 'Generates activity for calibrating telemetry gizmos.'
  s.authors     = ['Kevin Fuhst']
  s.files       = Dir.glob(['lib/**/*', 'bin/*', 'README.md'])

  s.executables = ['eag']
end
