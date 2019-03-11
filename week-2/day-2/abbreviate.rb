def abbrev_name(name)
  array = name.split(" ")
  first =[]
  array.each do |v|
    first << (v.slice(0)).capitalize
  end
  result = first.join(".")
  puts result
  return result
end

n = "samantha harris"
abbrev_name(n)
