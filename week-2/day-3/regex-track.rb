# exercises in https://www.hackerrank.com/domains/regex?filters%5Bstatus%5D%5B%5D=unsolved

1st_input = think?
Regex_Pattern = '(^[^]\d[^aeiou][^bcDF][^\s][^AEIOU][^.,]$)'
Regex_Pattern = '^\D[^aeiou][^bcDF][^\s][^AEIOU][^.,]$' #\D = [^]\d  OJO:checkear [\D]
print !!(gets =~ /#{Regex_Pattern}/)

2nd_input = "h4CkR"
Regex_Pattern = "^[a-z][1-9][^a-z][^A-Z][A-Z]"
print !!(gets =~ /#{Regex_Pattern}/)1st_input = think?
Regex_Pattern = '(^[^]\d[^aeiou][^bcDF][^\s][^AEIOU][^.,]$)'
Regex_Pattern = '^\D[^aeiou][^bcDF][^\s][^AEIOU][^.,]$' #\D = [^]\d  OJO:checkear [\D]
print !!(gets =~ /#{Regex_Pattern}/)

2nd_input = "h4CkR"
Regex_Pattern = "^[a-z][1-9][^a-z][^A-Z][A-Z]"
print !!(gets =~ /#{Regex_Pattern}/)

3rd_input = "2222222222aaaaaaaaaa2222222222aaaaaaaaaa13 57"
Regex_Pattern = '^[A-Z|a-z|02468]{40}[13579|\s]{5}$'
print !!(gets =~ /#{Regex_Pattern}/)