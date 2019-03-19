def validBraces(braces)
  pair = {")" => "(", "]" => "[", "}" => "{"}
  concat = ""
  braces.chars.each do |val|
    size = concat.length
    if pair.key?(val)
      if size == 0 || pair[val] != concat[size - 1]
        return false 
      elsif pair[val] == concat[size - 1]
        concat[size - 1] = ""
      end
    else
      concat += val
    end
  end
  concat == ""
end