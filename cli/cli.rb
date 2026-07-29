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

  def view_releases(artist)
    puts
    puts "Releases for #{artist.name}"
    puts "-------------------------"

    if artist.releases.empty?
      puts
      puts "No releases found."
      return
    end

    artist.releases.each_with_index do |release, index|
      puts
      puts "#{index + 1}. #{release.title}"
      puts "   Type: #{release.release_type}"
      puts "   Year: #{release.release_year}"
      puts "   Rating: #{release.rating}"

      unless release.notes.nil? || release.notes.empty?
        puts "   Notes: #{release.notes}"
      end
    end
  end

  def view_all_releases
    releases = Release.includes(:artist).order(:title)

    puts
    puts "All Releases"
    puts "------------"

    if releases.empty?
      puts
      puts "No releases found."
      return
    end

    releases.each_with_index do |release, index|
      puts
      puts "#{index + 1}. #{release.title}"
      puts "   Artist: #{release.artist.name}"
      puts "   Type: #{release.release_type}"
      puts "   Year: #{release.release_year}"
      puts "   Rating: #{release.rating}"

      unless release.notes.nil? || release.notes.empty?
        puts "   Notes: #{release.notes}"
    end
  end
end

  def add_release(artist)
  puts
  puts "Add a Release"
  puts "-------------"

  print "Title: "
  title = gets.chomp

  print "Release year: "
  release_year_input = gets.chomp

  print "Release type: "
  release_type = gets.chomp

  print "Rating (1-10): "
  rating_input = gets.chomp

  print "Notes: "
  notes = gets.chomp

  release_year =
    if release_year_input.empty?
      nil
    else
      release_year_input.to_i
    end

  rating =
    if rating_input.empty?
      nil
    else
      rating_input.to_i
    end

  release = artist.releases.new(
    title: title,
    release_year: release_year,
    release_type: release_type,
    rating: rating,
    notes: notes
  )

  if release.save
    puts
    puts "'#{release.title}' was added to #{artist.name}."
  else
    puts
    puts "Release could not be added."

    release.errors.full_messages.each do |message|
      puts "- #{message}"
    end
  end
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

def view_release_details(release)
  puts
  puts release.title
  puts "-" * release.title.length
  puts "Artist: #{release.artist.name}"
  puts "Type: #{release.release_type}"
  puts "Year: #{release.release_year}"
  puts "Rating: #{release.rating}"

  unless release.notes.nil? || release.notes.empty?
    puts "Notes: #{release.notes}"
  end
end

def update_release(release)
  puts
  puts "Update Release"
  puts "--------------"
  puts "Press Enter to keep the current value."
  puts

  print "Title [#{release.title}]: "
  title = gets.chomp

  print "Release year [#{release.release_year}]: "
  release_year_input = gets.chomp

  print "Release type [#{release.release_type}]: "
  release_type = gets.chomp

  print "Rating [#{release.rating}]: "
  rating_input = gets.chomp

  print "Notes [#{release.notes}]: "
  notes = gets.chomp

  updated_attributes = {
    title: title.empty? ? release.title : title,
    release_year: release_year_input.empty? ? release.release_year : release_year_input.to_i,
    release_type: release_type.empty? ? release.release_type : release_type,
    rating: rating_input.empty? ? release.rating : rating_input.to_i,
    notes: notes.empty? ? release.notes : notes
  }

  if release.update(updated_attributes)
    puts
    puts "'#{release.title}' was updated successfully."
  else
    puts
    puts "Release could not be updated."

    release.errors.full_messages.each do |message|
      puts "- #{message}"
    end
  end
end

def delete_release(release)
  puts
  puts "Delete Release"
  puts "--------------"
  puts "You are about to delete '#{release.title}'."
  print "Are you sure? (y/n): "

  confirmation = gets.chomp.downcase

  if confirmation == "y"
    title = release.title
    release.destroy

    puts
    puts "'#{title}' was deleted."
    true
  else
    puts
    puts "Deletion canceled."
    false
  end
end

def delete_release(release)
  puts
  puts "Delete Release"
  puts "--------------"
  puts "You are about to delete '#{release.title}'."
  print "Are you sure? (y/n): "

  confirmation = gets.chomp.downcase

  if confirmation == "y"
    title = release.title
    release.destroy

    puts
    puts "'#{title}' was deleted."
    true
  else
    puts
    puts "Deletion canceled."
    false
  end
end

  def exit_program
    puts
    puts "Thanks for using Crate Digger."
  end
end