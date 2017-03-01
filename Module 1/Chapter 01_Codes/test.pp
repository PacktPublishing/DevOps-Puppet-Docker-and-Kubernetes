if $::mtu_eth0 <= 1500 {
  notify {"Not Jumbo Frames": }
}
