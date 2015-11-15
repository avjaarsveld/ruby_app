require './spec/spec_helper'
require "./lib/data_cruncher"

describe DataCruncher do
  data = {}
  data['/help_page/1'] = ['126.318.035.038', '929.398.951.889', '444.701.448.104']
  data['/contact']     = ['184.123.665.067']
  data['/home']        = ['184.123.665.067', '444.701.448.104', '444.701.448.104', '444.701.448.104']

  it 'can return an array of webpages with most page views ordered from most pages views to less page views' do
    expected_result = ['/home 4 visits', '/help_page/1 3 visits', '/contact 1 visit']
    expect(DataCruncher.new(data).most_page_views).to eq expected_result
  end

  it 'can return an array of webpages with most unique page views also ordered' do
    expected_result = ["/help_page/1\t3 unique views", "/home\t2 unique views", "/contact\t1 unique view"]
    expect(DataCruncher.new(data).most_unique_page_views).to eq expected_result
  end
end