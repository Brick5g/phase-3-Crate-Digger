module ReleaseDisplay
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
end