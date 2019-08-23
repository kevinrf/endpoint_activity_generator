# Endpoint Activity Generator
This application generates endpoint activity from defined scenarios in order to
verify that a detection agent is generating the appropriate telemetry from such
activity.

## Install
1. [Install Ruby](https://www.ruby-lang.org/en/documentation/installation/) if necessary.
2. Clone the repository:
```bash
$ git clone https://github.com/kevinrf/endpoint_activity_generator.git
```
3. Build and install the gem (optional):
```bash
# from inside the repository:
$ gem build endpoint_activity_generator.gemspec
$ gem install endpoint_activity_generator
```

## Run
### As an installed gem
```bash
$ eag --help
```

### Directly from the repository
```bash
$ ./bin/eag
```
On Windows the shebang line is not supported, so execute ruby explicitly:
```
> ruby .\bin\eag
```

## Use
```
Usage: eag [options]
    -f, --file FILE                  Scenario file to run.
    -h, --help                       Show this message.
    -l, --log-format FORMAT          Log formatter to use (e.g. 'json').
    -o, --output OUTPUT              Log file destination. If not present, logs are printed to STDOUT.
```

### Scenario files
You must specify a scenario file to run. A scenario file is a Ruby file that
defines the activities that will be performed (e.g. creating/updating files on
the file system) with very lightweight domain-specific language. For example:
```ruby
create_file 'example.txt'
modify_file 'example.txt', append_data: "Lorem ipsum dolor sit amet\n"
delete_file 'example.txt'
transmit_data 'example.com', 80, data: "GET / HTTP/1.1\nHost: example.com\n\n"
run_process 'echo', 'hello world'
run_process 'cal'
```
Supported activities for use in scenarios are defined in `lib/activities`.

### Logging
Supported log formats are defined in `lib/log_format` and include `pretty`
(default), `json`, and `raw`.

### Example
To run the example scenario and output the logs as newline-separated JSON:
```
$ eag -f scenarios/example.rb --log-format json
```

## Test
1. Install the Bundler gem if necessary:
```bash
$ gem install bundler
```
2. Install the test dependencies:
```bash
$ bundle install
```
3. Run the tests:
```bash
$ bundle exec rspec --format documentation
```
