$count = [1,2,3,4,5]
# reduce
$sum = reduce ($count) | $total, $i | { $total + $i }
notice("Sum is $sum")

# filter
$filter = filter ($count) | $i | { $i > 3 }
notice("Filtered array is $filter")

# map
$map = map ($count) | $i | { $i * $i }
notice("Square of array is $map")

# slice
define firewall ($dport,$source,$action) {
  notice ("$source access to $dport is $action")
}
$firewall_rules = ['192.168.0.1','80','192.168.0.10','443']
slice ($firewall_rules,2) |$ip, $port| { notice("Allow $ip on $port") }
slice ($firewall_rules,2) |$ip, $port| {
  firewall {"$port from $ip":
    dport  => $port,
    source => "$ip",
    action => 'accept',
  }
}

# each
each ($count) |$c| { notice($c) }
