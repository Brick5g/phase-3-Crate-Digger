module ArtistActions
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

    artist = Artist.new(
      name: name,
      genre: genre,
      hometown: hometown
    )

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

  def update_artist(artist)
    puts
    puts "Update Artist"
    puts "-------------"
    puts "Press Enter to keep the current value."
    puts

    print "Name [#{artist.name}]: "
    name = gets.chomp

    print "Genre [#{artist.genre}]: "
    genre = gets.chomp

    print "Hometown [#{artist.hometown}]: "
    hometown = gets.chomp

    updated_attributes = {
      name: name.empty? ? artist.name : name,
      genre: genre.empty? ? artist.genre : genre,
      hometown: hometown.empty? ? artist.hometown : hometown
    }

    if artist.update(updated_attributes)
      puts
      puts "'#{artist.name}' was updated successfully."
    else
      puts
      puts "Artist could not be updated."

      artist.errors.full_messages.each do |message|
        puts "- #{message}"
      end
    end
  end

  def delete_artist(artist)
    puts
    puts "Delete Artist"
    puts "-------------"
    puts "This will also delete all releases belonging to #{artist.name}."
    print "Are you sure? (y/n): "

    confirmation = gets.chomp.downcase

    if confirmation == "y"
      artist.destroy

      puts
      puts "'#{artist.name}' was deleted."
      true
    else
      puts
      puts "Deletion canceled."
      false
    end
  end
end