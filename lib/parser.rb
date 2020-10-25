class Parser
  attr_reader :site_visits

  def initialize
    @site_visits = []
  end

  def get_log_data(log)
    File.open(log).each do |line|
      fields = line.split(' ') 
      page, url = fields[0], fields[1]
      site_visits << { page: page, url: url }
    end
    puts site_visits
  end
end

# parser = Parser.new
# parser.get_log_data(ARGV.first)