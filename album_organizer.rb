require "./lib/album"


  new_album = Album.new ({:title => 'Warning', :artist => 'Greenday'})
  new_album = Album.new ({:title => 'Dookie', :artist => 'Greenday'})
  new_album = Album.new ({:title => 'The Cost of Living', :artist => 'Jason Webley'})
  cd = Album.new ({:title => 'Jagged Little Pill', :artist => "Alanis Morissette"})
  cd = Album.new ({:title => "Take Offs and Landings", :artist => "Rilo Kiley"})


def main_menu
  @counter_array = []
  puts "\nPress 'a' to add an album to your collection.\nPress 'l' to list all your albums.\nEnter an artist or title to display all associated albums.\nPress 'x' to exit the program."
    input = gets.chomp
    if input == 'x'
      exit
    elsif input == 'a'
      add_album
    elsif input == 'l'
      clear_screen
      list_albums(Album.albums)
      edit_info
    else
      displayed_albums = []
      clear_screen
      counter = 0
      Album.search(input).each do |album|
        counter += 1
        displayed_albums << album
        puts "#{counter}.  #{album.title} by #{album.artist}\n"
      end
      if displayed_albums == []
        puts "That album is not a part of your collection."
        main_menu
      end
    edit_info
    end
end

def add_album
  clear_screen
  puts "What is the title of the album?"
  title = gets.chomp
  puts "Who is it by?"
  artist = gets.chomp
  new_album = Album.new({:title => title, :artist => artist})
  puts "Album added."
  main_menu
end

def list_albums array
  counter = 0
  array.each do |album|
  counter += 1
  @counter_array << counter
  puts "#{counter}.  #{album.title} by #{album.artist}\n"
  end
end

def edit_info
  puts "\nEnter a number to edit an album's info or enter 'm' to return to the main menu"
  num = gets.chomp
  if num == 'm'
    clear_screen
    main_menu
  elsif @counter_array.include?(num.to_i)
      clear_screen
      puts "#{Album.albums[num.to_i-1].title} by #{Album.albums[num.to_i-1].artist}"
      puts "Press 't' to edit the title.  Press 'a' to edit the artist."
      choice = gets.chomp
      if choice == 't'
        puts "Enter your new title"
        title = gets.chomp
        Album.albums[num.to_i-1].edit_title(title)
        puts "Title changed to #{Album.albums[num.to_i-1].title}"
        main_menu
      elsif choice == 'a'
        puts "Enter your new artist"
        artist = gets.chomp
        Album.albums[num.to_i-1].edit_artist(artist)
        puts "Artist changed to #{Album.albums[num.to_i-1].artist}"
        main_menu
      end
  else
    puts "that's not a valid option. Try again"
    edit_info
  end
end

def clear_screen
  puts "\e[H\e[2J"
end

main_menu
