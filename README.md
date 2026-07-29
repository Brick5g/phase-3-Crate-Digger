# Crate Digger

A command-line application built with Ruby and ActiveRecord that allows users to build and manage a personal music collection.

Users can create artists, organize their releases, update information, and manage their collection entirely from the terminal.

---

## Features

### Artist Management

- View all artists
- Add a new artist
- Update artist information
- Delete an artist
- Automatic deletion of an artist's releases when the artist is removed

### Release Management

- View all releases
- View releases for a specific artist
- Add releases to an artist
- View detailed release information
- Update release information
- Delete releases

### Data Validation

Artist validations:

- Name is required
- Artist names must be unique

Release validations:

- Title is required
- Release year is required
- Release type is required
- Rating must be between 1 and 10
- Release type must be one of:

  - Album
  - EP
  - Mixtape
  - Single
  - Compilation

---

## Built With

- Ruby
- ActiveRecord
- SQLite3
- Pry

---

## Installation

Clone the repository

```bash
git clone git@github.com:Brick5g/phase-3-Crate-Digger.git
```

Move into the project

```bash
cd phase-3-Crate-Digger
```

Install dependencies

```bash
bundle install
```

Create the database

```bash
bundle exec rake db:migrate
```

Seed the database

```bash
bundle exec rake db:seed
```

Run the application

```bash
ruby cli/main.rb
```

---

## Project Structure

```
cli/
│
├── main.rb
├── cli.rb
├── main_menu.rb
├── artist_menu.rb
├── artist_actions.rb
├── release_menu.rb
├── release_display.rb
└── release_actions.rb
```

The application is organized into modules to separate responsibilities:

- Main Menu
- Artist Menus
- Artist Actions
- Release Menus
- Release Display
- Release Actions

This keeps the application modular, readable, and easier to maintain.

---

## Database Relationships

Artist

- has_many Releases

Release

- belongs_to Artist

Deleting an artist automatically removes all associated releases through ActiveRecord's `dependent: :destroy` relationship.

---

## Example Workflow

```
Main Menu

1. View all artists
2. Add an artist
3. Select an artist
4. View all releases
5. Add a release
6. Exit
```

Selecting an artist opens an artist-specific menu where releases can be viewed, created, updated, or deleted.

---

## Future Improvements

Potential future enhancements include:

- Search artists
- Search releases
- Sort releases by year or rating
- Filter by genre
- Favorite releases
- Export collection
- Colorized terminal output

---
