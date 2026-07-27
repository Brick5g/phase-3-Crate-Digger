# Crate Digger

## CLI Concept

Crate Digger is a Ruby command-line application that allows music listeners to build and manage a personal catalog of artists and their releases.

Users can save artists, add albums, mixtapes, EPs, and singles to an artist's catalog, record ratings and personal notes, update existing information, and remove records they no longer want to track.

Crate Digger stores all information in a local SQLite database using Active Record. An optional import feature may allow users to retrieve release information from a supported public music source before confirming whether they want to save it.

---

## Domain Model

### Artist

An Artist has many Releases.

Artist data will include:

- Name
- Genre
- Hometown

### Release

A Release belongs to one Artist.

Release data will include:

- Title
- Release year
- Release type
- Rating
- Personal notes
- Artist ID

### Relationship

Artist has many Releases.

Release belongs to an Artist.

```text
Artist 1 ─────────< many Releases
```


## Core Features

- Display a menu-driven command-line interface
- Create and save a new artist
- Display all saved artists
- View an individual artist and their associated releases
- Update an artist while displaying their current information
- Delete an artist
- Create a release associated with an artist
- Display all releases
- Display releases belonging to a selected artist
- Update a release while displaying its current information
- Delete a release
- Validate required artist and release information
- Validate release ratings
- Handle invalid menu selections without crashing
- Optionally import release information from a supported public source

---

## Validations

### Artist Validations

An Artist must:

- Have a name
- Have a unique name

If validation fails, the application should display a helpful error message and allow the user to try again without crashing.

### Release Validations

A Release must:

- Have a title
- Belong to an artist
- Use an integer release year when a year is provided
- Use a rating between 1 and 10 when a rating is provided
- Use a supported release type when a release type is provided

Supported release types may include:

- Album
- Mixtape
- EP
- Single

If validation fails, the application should display the relevant error messages and allow the user to correct the information.