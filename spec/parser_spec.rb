require 'parser.rb'

describe Parser do
  let(:parser) { Parser.new }
  test_log = File.dirname(__FILE__) + '/test.log'
  
  describe '#get_log_data' do
    it 'stores data as array of hashes' do
      parser.get_log_data(test_log)
      expect(parser.site_visits).to include({ page: '/about/2', url: '444.701.448.104' })
    end
  end

  describe '#page_visit_count' do
    it 'sorts and counts the data' do
      parser.get_log_data(test_log)
      expect(parser.page_visit_count).to eq([['/help_page/1', 6], ['/contact', 3], ['/home', 3], ['/about/2', 3], ['/index', 3], ['/about', 2]])
    end
  end
end
