#if $::timezone == 'UTC' {
#  notify { 'Universal Time Coordinated': }
#} else {
#  notify { "$::timezone is not UTC": }
#}

if $::timezone == 'UTC' {
  notify { 'Universal Time Coordinated': }
} elsif $::timezone == 'GMT' {
  notify { 'Greenwich Mean Time': }
} else {
  notify { "$::timezone is not UTC": }
}

