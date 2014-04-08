require 'facter/iis_log_dir_parser'


describe IISParser, 'when getting default log dir' do
  let :xml_sample do
    File.read(File.expand_path('../data/default_site_example.xml', __FILE__))
  end

  subject do
    ENV['SystemDrive'] = 'C:'
    IISParser.parse_log_dir xml_sample
  end

  it do 
    should eq 'C:\inetpub\logs\LogFiles'
  end
end
