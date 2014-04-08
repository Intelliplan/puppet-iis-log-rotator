require 'facter'
require 'facter/iis_log_dir_parser'

Facter.add("iis_root_log_dir") do
  confine :kernel => "windows"
  setcode do
    xml = Facter::Util::Resolution.exec("#{ENV['SystemRoot']}\\system32\\inetsrv\\appcmd.exe list config -section:sites")
    IISParser.parse_log_dir xml
  end
end
