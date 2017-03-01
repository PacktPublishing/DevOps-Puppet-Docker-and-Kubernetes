$interface = {
  'name' => 'eth0',
  'ip'   => '192.168.0.1',
  'mac'  => '52:54:00:4a:60:07' 
}
notify { "(${interface['ip']}) at ${interface['mac']} on ${interface['name']}": }

