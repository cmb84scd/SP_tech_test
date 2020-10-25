require 'parser.rb'

describe Parser do
  let(:parser) { Parser.new }
  test_log = File.dirname(__FILE__) + '/test.log'
  
  describe '#get_log_data' do
    it 'stores data as array of hashes' do
      parser.get_log_data(test_log)
      expect(parser.site_visits).to include({page: '/about/2', url: '444.701.448.104'})
    end
  end
end