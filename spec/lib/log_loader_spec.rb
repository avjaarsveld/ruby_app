require './spec/spec_helper'
require "./lib/log_loader"
require 'tempfile' # Todo: Gemfile

describe LogLoader do
  it 'returns an error when the file is not found' do
    expect{LogLoader.new('other_file.log')}.to raise_exception(ArgumentError)
  end
  
  it 'can return a hash with urls as keys and arrays of ip_addresses as values, loaded from a file' do
    file = Tempfile.new('sample.log')
    file.write("/help_page/1 126.318.035.038\n/contact 184.123.665.067\n/home 184.123.665.067\n/about/2 444.701.448.104\n/help_page/1 929.398.951.889")
    file.close

    expected_result = {}
    expected_result['/help_page/1'] = ['126.318.035.038', '929.398.951.889']
    expected_result['/contact']     = ['184.123.665.067']
    expected_result['/home']        = ['184.123.665.067']
    expected_result['/about/2']     = ['444.701.448.104']

    expect(LogLoader.new(file.path).data).to eq expected_result
  end
end