$:.unshift(File.dirname(File.expand_path(__FILE__)))

require 'peak/collection'
require 'peak/config'
require 'peak/data_source'
require 'peak/graph'
require 'peak/host'
require 'peak/rrd_query'

module Peak
  @collections = []
  @hosts = []
  @current_host = nil
  @graphs = []
  # support both ubuntu and homebrew collectd locations
  @collectd_dir = File.directory?("/var/lib/collectd") ? "/var/lib/collectd/rrd" : "/usr/local/var/lib/collectd"

  class << self
    attr_accessor :collections
    attr_accessor :hosts
    attr_accessor :current_host
    attr_accessor :graphs
    attr_accessor :collectd_dir

    def load_config
      Config.load_config
    end

    def logger
      @logger ||= ::Logger.new($stdout).tap { |l| l.formatter = Logger::Formatter.new }
    end
  end
end
