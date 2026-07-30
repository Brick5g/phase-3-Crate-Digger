module ReleaseActions
  def add_release(artist)
    puts
    puts "Add a Release"
    puts "-------------"
    puts "Press Enter to skip optional fields."
    puts

    print "Title: "
    title = gets.chomp

    print "Release year (4-digit year, example: 2015): "
    release_year_input = gets.chomp

    print "Release type (#{Release::RELEASE_TYPES.join(", ")}): "
    release_type = gets.chomp

    print "Rating (whole number from 1-10): "
    rating_input = gets.chomp

    print "Notes: "
    notes = gets.chomp

    release_year =
      if release_year_input.empty?
        nil
      else
        release_year_input.to_i
      end

    release_type = nil if release_type.empty?

    rating =
      if rating_input.empty?
        nil
      else
        rating_input.to_i
      end

    notes = nil if notes.empty?

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

  def update_release(release)
    puts
    puts "Update Release"
    puts "--------------"
    puts "Press Enter to keep the current value."
    puts

    print "Title [#{release.title}]: "
    title = gets.chomp

    print "Release year [#{release.release_year}] (4-digit year): "
    release_year_input = gets.chomp

    print "Release type [#{release.release_type}] (#{Release::RELEASE_TYPES.join(", ")}): "
    release_type = gets.chomp

    print "Rating [#{release.rating}] (whole number from 1-10): "
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
end