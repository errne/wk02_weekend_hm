require_relative ('./guest')

class Room

  attr_reader :theme, :capacity, :songslist

  def initialize(theme, capacity, songslist)
    @theme = theme
    @capacity = capacity
    @songslist = songslist
    @guests = []
  end

  def add_guest(guest)
    @guests << guest
  end

  def guest_count()
    return @guests.count
  end

  def guest_remove(guest)
    @guests.delete(guest)
  end

  def count_spaces_left()
    return @capacity - @guests.length
  end

  def add_song(song)
    @songslist << song
  end

end
