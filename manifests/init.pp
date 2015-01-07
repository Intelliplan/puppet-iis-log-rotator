class iis_log_rotator(
  $how_old_days = 1,
  $how_often_trigger = {
    schedule   => daily,
    start_time => '01:00',
    every      => 1,
  }
) {

  $remove_log_command = "(ls . -include *.log -recurse) | where-object {\$_.LastWriteTime -lt (Get-Date).AddDays(-\${how_old_days})} | % { \$_.Delete() }"

  scheduled_task { 'Remove Old IIS Logs':
    ensure      => present,
    enabled     => true,
    command     => $::powershell_location,
    arguments   => $remove_log_command,
    trigger     => $how_often_trigger,
    working_dir => $::iis_root_log_dir,
  }
}
