Regex_Pattern = '^[^0-9][^aeiou][^bcDF][^\s][^AEIOU][^\.\,]$'

print !!(gets =~ /#{Regex_Pattern}/)
