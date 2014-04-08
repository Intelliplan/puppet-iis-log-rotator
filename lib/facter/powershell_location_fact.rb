require 'facter'

Facter.add('powershell_location') do
  confine :kernel => 'windows'
  setcode do
    ENV['SystemDrive'] + '\windows\system32\WindowsPowershell\v1.0\powershell.exe'
  end
end
