Regex_Pattern = '^[a-z][1-9][^a-z][^A-Z][A-Z].*{5,}'
print !!(gets =~ /#{Regex_Pattern}/)
