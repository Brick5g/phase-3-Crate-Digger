module ArtistMenu
  def select_artist
    artists = Artist.order(:name)

    if artists.empty?
      puts
      puts "No artists found."
      return
    end

    puts
    puts "Select an Artist"
    puts "----------------"

    artists.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end

    print "> "
    choice = gets.chomp.to_i

    if choice < 1 || choice > artists.length
      puts
      puts "Invalid artist selection."
      return
    end

    selected_artist = artists[choice - 1]

    artist_menu(selected_artist)
  end

  def artist_menu(artist)
    loop do
      puts
      puts "Artist: #{artist.name}"
      puts "Genre: #{artist.genre}"
      puts "Hometown: #{artist.hometown}"
      puts
      puts "1. View releases"
      puts "2. Add a release"
      puts "3. Update artist"
      puts "4. Delete artist"
      puts "5. Back to main menu"
      print "> "

      choice = gets.chomp

      case choice
      when "1"
        select_release(artist)
      when "2"
        add_release(artist)
      when "3"
        update_artist(artist)
      when "4"
        deleted = delete_artist(artist)
        break if deleted
      when "5"
        break
      else
        puts
        puts "Invalid selection. Please choose a number from 1 to 5."
      end
    end
  end
end