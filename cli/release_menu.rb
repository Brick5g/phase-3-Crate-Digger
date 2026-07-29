module ReleaseMenu
  def select_artist_for_release
    artists = Artist.order(:name)

    if artists.empty?
      puts
      puts "No artists found. Add an artist before adding a release."
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
    add_release(selected_artist)
  end

  def select_release(artist)
    releases = artist.releases.order(:title)

    if releases.empty?
      puts
      puts "No releases found."
      return
    end

    puts
    puts "Select a Release"
    puts "----------------"

    releases.each_with_index do |release, index|
      puts "#{index + 1}. #{release.title}"
    end

    print "> "
    choice = gets.chomp.to_i

    if choice < 1 || choice > releases.length
      puts
      puts "Invalid release selection."
      return
    end

    selected_release = releases[choice - 1]
    release_menu(selected_release)
  end

  def release_menu(release)
    loop do
      puts
      puts "Release: #{release.title}"
      puts "Artist: #{release.artist.name}"
      puts
      puts "1. View details"
      puts "2. Update release"
      puts "3. Delete release"
      puts "4. Back to artist menu"
      print "> "

      choice = gets.chomp

      case choice
      when "1"
        view_release_details(release)
      when "2"
        update_release(release)
      when "3"
        deleted = delete_release(release)
        break if deleted
      when "4"
        break
      else
        puts
        puts "Invalid selection. Please choose a number from 1 to 4."
      end
    end
  end
end