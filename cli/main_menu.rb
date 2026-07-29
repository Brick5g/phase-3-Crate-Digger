module MainMenu
  def welcome
    puts
    puts "=========================="
    puts "       CRATE DIGGER"
    puts "=========================="
    puts
    puts "Build and manage your personal music collection."
    puts
  end

  def main_menu
    loop do
      display_main_menu
      choice = gets.chomp

      case choice
      when "1"
        view_artists
      when "2"
        add_artist
      when "3"
        select_artist
      when "4"
        view_all_releases
      when "5"
        select_artist_for_release
      when "6"
        exit_program
        break
      else
        puts
        puts "Invalid selection. Please choose a number from 1 to 6."
      end
    end
  end

  def display_main_menu
    puts
    puts "Main Menu"
    puts "---------"
    puts "1. View all artists"
    puts "2. Add an artist"
    puts "3. Select an artist"
    puts "4. View all releases"
    puts "5. Add a release"
    puts "6. Exit"
    print "> "
  end

  def exit_program
    puts
    puts "Thanks for using Crate Digger."
  end
end