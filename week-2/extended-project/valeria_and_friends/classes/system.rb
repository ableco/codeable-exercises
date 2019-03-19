require "csv"

class System
  TEXT_INSTRUCTIONS = [
    "+------------------------------------------+",
    "  5 Star Wars curiosities you didn't know:",
    "+------------------------------------------+",
    "  1. Most expensive vehicles",
    "  2. Fastest vehicles",
    "  3. Tallest people",
    "  4. Heaviest people",
    "  5. Most populated planets",
    "",
    "  6. Exit",
    "",
    "Choose one"
  ]

  def initialize(tops)
    @tops = tops
  end

  def run
    print_instructions
    chosen_number = get_chosen_number
    system "clear"
    chosen_top = get_top_choice(chosen_number, @tops)
    generate_printable(chosen_top)
    print_chosen_top(chosen_top.printable_data)
    want_csv = ask_csv?
    create_csv(chosen_top.name_main_attr, chosen_top.printable_data) if want_csv
    system "clear"
    run
  end

  def print_instructions
    puts TEXT_INSTRUCTIONS
  end

  def get_chosen_number
    numero_top = gets.to_i
    numero_top
  end

  def get_top_choice(choice, tops)
    index_tops = choice - 1
    case choice
    when 1
      puts "MOST EXPENSIVE VEHICLES of Star Wars\n"
      return tops[index_tops]
    when 2
      puts "FASTEST VEHICLES of Star Wars\n"
      return tops[index_tops]
    when 3
      puts "TALLEST PEOPLE of Star Wars\n"
      return tops[index_tops]
    when 4
      puts "HEAVY ONES of Star Wars\n"
      return tops[index_tops]
    when 5
      puts "MOST POPULATED PLANETS of Star Wars\n"
      return tops[index_tops]
    when 6
      puts "¡Bye bye! \n"
      exit
    else
      puts "There is no top like that! \n"
    end
  end

  def generate_printable(chosen_top)
    chosen_top.give_me_the_top if chosen_top.printable_data.length == 0
  end

  def print_chosen_top(arr_print)
    c = arr_print.transpose
    d = c.map do |x|
      x.max_by(&:length).length
    end

    arr_print.each do |row|
      pretty = row.map.with_index do |item, index|
        longest = d[index]
        lack_of_spaces = longest - item.length
        spaces = " " * lack_of_spaces
        "| #{item}#{spaces} "
      end
      puts "#{pretty.join('') }|"
    end
  end

  def ask_csv?
    puts "\nWould you like to create a CSV file with this information? (yes / nope)"
    response = gets.chomp.to_s
    response == "yes"
  end

  def create_csv(namefile, arr_data)
    CSV.open("#{namefile}.csv", "wb") do |csv|
      arr_data.each do |item|
        csv << item
      end
    end
  end
end
