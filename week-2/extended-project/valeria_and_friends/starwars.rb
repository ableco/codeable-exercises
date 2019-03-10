# require "csv"
# require "./top5s/tops"

# def instructions
#   puts "---------------------------------"
#   puts "1. Top 5 most expensive vehicles"
#   puts "2. Top 5 tallest people"
#   puts "3. Top 5 most populated planets"
#   puts "4. Top 5 heavy ones"
#   puts "5. Top 5 fastest vehicles"
#   puts "\n"
#   puts "Choose one"
#   puts "---------------------------------"
# end

# def put_inchart
#   instructions
#   num = get_choice
#   case num
#   when 1
#     puts "MOST EXPENSIVE VEHICLES \n"
#     print(most_expensive_vehicles, "top_expensive_vehicles")
#   when 2
#     puts "TALLEST PEOPLE \n"
#     print(tallest_people, "top_tallest_people")
#   when 3
#     puts "MOST POPULATED PLANETS \n"
#     print(most_populated_planets, "top_populated_planets")
#   when 4
#     puts "HEAVY ONES \n"
#     print(heaviest_people, "top_heavy_ones")
#   when 5
#     puts "FASTEST VEHICLES \n"
#     print(fastest_vehicles, "top_fastest_vehicles")
#   else
#     puts "there is no top like that! \n"
#   end
# end

# def create_csv(namefile, arr_data)
#   CSV.open("#{namefile}.csv", "wb") do |csv|
#     arr_data.each do |item|
#       csv << item
#     end
#   end
# end

# def csv_file?
#   puts "\nWould you like to create a CSV file with this information? (yes / nope)"
#   response = gets.chomp.to_s
#   response == "yes"
# end

# def print(array_imp, name_top)
#   array_1, array_2, array_3, array_4, array_5, array_6 = array_imp.each_slice(1).to_a
#   puts array_1.join(" | ")
#   puts array_2.join(" | ")
#   puts array_3.join(" | ")
#   puts array_4.join(" | ")
#   puts array_5.join(" | ")
#   puts array_6.join(" | ")

#   csv_q = csv_file?
#   create_csv(name_top, array_imp) if csv_q
#   system "clear"
#   put_inchart
# end

# def get_choice
#   numero_top = gets.to_i
#   system "clear"
#   numero_top
# end

# put_inchart


col_labels = { date: "Date", from: "From", subject: "Subject" }
arr = [{date: "2014-12-01", from: "Ferdous", subject: "Homework this week"},
  {date: "2014-12-01", from: "Dajana", subject: "Keep on coding! :)"},
  {date: "2014-12-02", from: "Ariane", subject: "Re: Homework this week"}]

# col_labels = ["Date", "From", "Subject"]
# arr = [["2014-12-01", "Ferdous", "Homework this week"],
#   ["2014-12-01", "Dajana", "Keep on coding! :)"],
#   ["2014-12-02", "Ariane", "Re: Homework this week"]]

@columns = col_labels.each_with_object({}) { |(llave,valor),h|
  h[llave] = {
    label: valor,
    width: [arr.map { |g| g[llave].size }.max, valor.size].max
  }
}

def write_header
  puts "| #{ @columns.map { |_,g| g[:label].ljust(g[:width]) }.join(' | ') } |"
end

def write_divider
  puts "+-#{ @columns.map { |_,g| "-"*g[:width] }.join("-+-") }-+"
end

def write_line(h)
  str = h.keys.map { |k| h[k].ljust(@columns[k][:width]) }.join(" | ")
  puts "| #{str} |"
end

write_divider
write_header
write_divider
arr.each { |h| write_line(h) }
write_divider