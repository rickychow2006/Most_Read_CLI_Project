require 'colorize'

class CLI 

    def valid_input(input_max)
        @@input = gets
        until @@input.to_i.between?(1,input_max)
            if @@input.to_i == 0
                puts "Good Bye!"
                exit
                break
            end
        puts "Please enter a number between 1-#{input_max}.".colorize(:red)
        @@input = gets
        end 
    end 

    def run
        puts 'Welcome to goodreads: 25 Most Read Books This Week In The US!'.colorize(:light_blue).colorize(:bold)
        sleep(1)
        puts "Loading.......................................................".colorize(:light_blue)
        Scraper.new.first_scrape
        puts "Done!".colorize(:light_blue)
        sleep(1)
        main_menu
        select_or_exit
    end 

    def main_menu 
        puts "25 Most Read Books This Week In The US".colorize(:light_blue).colorize(:bold)
        puts "--------------------------------------".colorize(:light_blue)
        Read.print_books(25)
        puts "Please enter a number between 1-25 to view that book or 0 to exit the prgoram".colorize(:light_cyan).colorize(:bold)
        valid_input(25)
        select_to_index = @@input.to_i - 1
        Read.all[select_to_index].print_full_review
    end 

    def select_or_exit
        puts "\n\nWould you like go back to the main menu?\n\n'1' for main menu\n'2' to exit program.".colorize(:light_cyan)
        valid_input(2)
        if @@input.to_i == 1
          main_menu
          select_or_exit
        elsif @@input.to_i == 2
          puts "Good Bye!".colorize(:light_cyan)
        end 
    end 
end 