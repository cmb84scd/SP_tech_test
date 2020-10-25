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
  end

  def page_visit_count
    visits = site_visits.each_with_object(Hash.new(0)) { |h1, h2| h2[h1[:page]] += 1 }
    visits.sort_by { |_k, v| -v }
  end
end

# parser = Parser.new
# parser.get_log_data(ARGV.first)
# parser.page_visit_count
