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

  def unique_page_visit_count
    unique = site_visits.uniq { |v| v.values }
    unique.each_with_object(Hash.new(0)) { |h1, h2| h2[h1[:page]] += 1 }.sort_by { |_k, v| -v }
  end

  def print_page_visit_info
    page_visit_count.map { |k, v| "#{k} #{v} visits" }
  end
end

# parser = Parser.new
# parser.get_log_data(ARGV.first)
# puts parser.unique_page_visit_count
