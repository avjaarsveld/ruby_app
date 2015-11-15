require 'optparse'
require_relative 'log_loader'
require_relative 'data_cruncher'

class Parser
  def initialize
    @options = {}

    OptionParser.new do |opts|
      opts.banner = "Usage: parser [options]"

      @options[:list_type] = :visits # default

      opts.parse
      @options[:log_filename] = ARGV.pop
      
      # Could raise an error insted of using this default - default seems more user friendly
      @options[:log_filename] = 'webserver.log' unless @options[:log_filename] # default

      # Optional argument with keyword completion for type of list - seems preferable to printing
      # out both lists (the question is not explicit about how/when to show which list)
      opts.on("-t", "--type [TYPE]", [:visits, :unique_visits],
              "Select list type (visits, unique_visits)") do |t|
        @options[:list_type] = t
      end

    end.parse!
  end

  def parse
    # This 'header' added to aid end user
    puts "Using file: #{@options[:log_filename]}"
    puts "List type: #{@options[:list_type]}"
    puts

    log_data = LogLoader.new(@options[:log_filename]).data

    puts DataCruncher.new(log_data).most_page_views if @options[:list_type] == :visits
    puts DataCruncher.new(log_data).most_unique_page_views if @options[:list_type] == :unique_visits
  end

end