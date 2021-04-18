class CLI 

    def start
        puts "Welcome to the public calendar database! We provide information on different major holidays in your country. Before we start, what is your name?"
        API.get_data
        input = user_input
        greet(input)
    end

    def user_input
        gets.strip
    end

    def greet(name)
        puts "Hello #{name}! Would you like to know what major holidays are in your country? Enter yes to see the list, enter exit to exit."
        menu
    end

    def menu
        selection = user_input
        if selection.downcase == "yes"
            print_holidays
        elsif selection.downcase == "exit"
            goodbye
        else
            invalid
        end
    end

    def goodbye
        puts "Thank you for visiting!"
    end

    def invalid
        puts "I didnt't quite get what you mean.. Enter yes to see the list again or exit to exit?"
        menu
    end

    def print_holidays
        Holidays.all.each.with_index(1) do |holiday, index|
            puts "#{index}. #{holiday.name}"
        end
        select_holiday
    end

    def select_holiday
        puts "Please enter name of holiday you want to learn more about."
        selection = user_input
        if Holidays.find_by_selection(selection)
            holiday = Holidays.find_by_selection(selection)
        else
            holiday = selection
        end
    
        holiday_details(holiday)
    end

    def holiday_details(holiday)
        if holiday == "exit"
            goodbye
        elsif holiday.class == Holidays
        puts ""
        puts ""
        puts "*****************************"
        puts "Name: #{holiday.name}"
        puts "Date: #{holiday.date}"
        puts "countryCode: #{holiday.countryCode}"
        puts "*****************************"
        puts ""
        puts ""
        puts "enter yes to see more holidays or exit to exit."
        menu
        else
            invalid
        end
    end
end
