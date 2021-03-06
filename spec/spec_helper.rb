require 'rubygems'
require 'bundler/setup'

$LOAD_PATH.unshift(File.expand_path('../../lib', __FILE__))

require 'zk-eventmachine'
require 'evented-spec'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.expand_path("../support/**/*.rb", __FILE__)].each {|f| require f}

case `uname -s`.chomp
when 'Linux'
#   $stderr.puts "WARN: setting EM.epoll = true for tests"
  EM.epoll = true
when 'Darwin'
#   $stderr.puts "WARN: setting EM.kqueue = true for tests"
  EM.kqueue = true
end

RSpec.configure do |config|
  config.mock_with :flexmock
  config.extend   SpecGlobalLogger
  config.include  SpecGlobalLogger
  config.extend   WaitWatchers
  config.include  WaitWatchers
end


