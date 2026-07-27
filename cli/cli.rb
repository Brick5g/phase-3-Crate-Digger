class CLI
  def start
    welcome
    main_menu
  end

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
        view_releases
      when "5"
        add_release
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

def view_artists
  puts

  artists = Artist.order(:name)

  if artists.empty?
    puts "No artists found."
    return
  end

  artists.each_with_index do |artist, index|
    puts "#{index + 1}. #{artist.name}"
  end
end

  def add_artist
    puts
    puts "Add an Artist"
    puts "-------------"

    print "Name: "
    name = gets.chomp

    print "Genre: "
    genre = gets.chomp

    print "Hometown: "
    hometown = gets.chomp

    artist = Artist.new(name: name, genre: genre, hometown: hometown)

    if artist.save
      puts
      puts "Artist '#{artist.name}' added successfully."
    else
      puts
      puts "Artist could not be added."

      artist.errors.full_messages.each do |message|
        puts "- #{message}"
      end
    end
  end

  def select_artist
    puts
    puts "Select an artist is coming soon."
  end

  def view_releases
    puts
    puts "View all releases is coming soon."
  end

  def add_release
    puts
    puts "Add a release is coming soon."
  end

  def exit_program
    puts
    puts "Thanks for using Crate Digger."
  end
end