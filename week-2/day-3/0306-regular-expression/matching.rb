Regex_Pattern = '^[123][012][xXsS0][30aA][xXsSuU][\.\,]$'

print !!(gets =~ /#{Regex_Pattern}/)
