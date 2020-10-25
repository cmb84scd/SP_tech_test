class Parser
  attr_reader :page_visits

  def initialize
    @page_visits = []
  end

  def get_log_data(log)
    File.open(log).each do |line|
      fields = line.split(' ') 
      page, url = fields[0], fields[1]
      page_visits << { page: page, url: url }
    end
  end

  def page_visit_count
    page_visits.each_with_object(Hash.new(0)) { |h1, h2| h2[h1[:page]] += 1 }.sort_by { |_k, v| -v }
  end

  def unique_page_view_count
    unique = page_visits.uniq { |v| v.values }
    unique.each_with_object(Hash.new(0)) { |h1, h2| h2[h1[:page]] += 1 }.sort_by { |_k, v| -v }
  end

  def print_page_visit_info
    page_visit_count.map { |k, v| "#{k} #{v} visits" }
  end

  def print_unique_page_view_info
    unique_page_view_count.map { |k, v| "#{k} #{v} unique views" }
  end
end

# parser = Parser.new
# parser.get_log_data(ARGV.first)
# puts parser.print_page_visit_info
# puts parser.print_unique_page_view_info
