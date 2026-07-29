module Branding
  VERSION = "1.0.0"

  BOOT_STEPS = [
    "Initializing database...",
    "Loading artists...",
    "Loading releases...",
    "Linking collections...",
    "Organizing vinyl shelves..."
  ].freeze

  LOADING_MESSAGES = [
    "Digging through the crates...",
    "Dropping the needle...",
    "Dusting off forgotten classics...",
    "Flipping to Side B...",
    "Cueing today's soundtrack...",
    "Searching for hidden gems...",
    "Organizing the collection...",
    "Cleaning dusty vinyl..."
  ].freeze

  def display_intro
    clear_screen
    display_header
    display_boot_sequence

    puts
    puts "> #{LOADING_MESSAGES.sample}"
    sleep(0.8)
    puts
  end

  private

  def display_header
    puts " ________________________________________________"
    puts "|                                                |"
    puts "|            CRATE DIGGER v#{VERSION}                 |"
    puts "|________________________________________________|"
    puts
  end

  def display_boot_sequence
    BOOT_STEPS.each do |step|
      print " #{step.ljust(38)}"
      sleep(0.2)
      puts "✓"
    end
  end

  def clear_screen
    system("clear") || system("cls")
  end
end