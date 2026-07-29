require_relative "main_menu"
require_relative "artist_menu"
require_relative "artist_actions"
require_relative "release_menu"
require_relative "release_display"
require_relative "release_actions"

class CLI
  include MainMenu
  include ArtistMenu
  include ArtistActions
  include ReleaseMenu
  include ReleaseDisplay
  include ReleaseActions

  def start
    welcome
    main_menu
  end
end