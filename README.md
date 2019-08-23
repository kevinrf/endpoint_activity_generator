# Endpoint Activity Generator
This application generates endpoint activity from defined scenarios in order to
verify that a detection agent is generating the appropriate telemetry from such
activity.

## Install
1. [Install Ruby](https://www.ruby-lang.org/en/documentation/installation/) if necessary.
2. Clone the repository:
```
$ git clone https://github.com/kevinrf/endpoint_activity_generator.git
```
3. Build and install the gem (optional):
```
# from inside the repository:
$ gem build endpoint_activity_generator.gemspec
$ gem install endpoint_activity_generator
```

## Run
As an installed gem:

```
$ eag --help
```

Or directly from the repository:
```
$ ./bin/eag --help
```

## Use
```
Usage: eag [options]
    -f, --file FILE                  Scenario file to run.
    -h, --help                       Show this message.
    -l, --log-format FORMAT          Log formatter to use (e.g. 'json').
    -o, --output OUTPUT              Log file destination. If not present, logs are printed to STDOUT.
```

You must specify a scenario file to run. A scenario file is a Ruby file that
defines the activities that will be performed (e.g. creating/updating files on
the file system) with very lightweight domain-specific language. See
`scenarios/example.rb` for an example.

Supported log formats are `pretty` (default), `json`, and `raw`.

## Test
1. Install the Bundler gem if necessary:
```
$ gem install bundler
```
2. Install the test dependencies:
```
$ bundle install
```
3. Run the tests:
```
$ bundle exec rspec --format documentation
```
