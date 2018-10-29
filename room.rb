require_relative ('./guest')
require('pry')

class Room

  attr_reader :theme, :capacity, :songslist

  def initialize(theme, capacity, songslist)
    @theme = theme
    @capacity = capacity
    @songslist = songslist
    @entry_fee = 15.0
    @till = 25.0
    @guests = []
  end

  def add_guest(guest)
    return "Sorry, the room is full" unless count_spaces_left > 0
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

  def check_feedback(guest)
    guest.cheer_loudly if @songslist.find { | song | guest.get_favourite_tune == song }
  end

  def check_till()
    return @till
  end

  def charge_entry_fee(guest)
    return "Sorry, the room is full" unless count_spaces_left > 0
    if guest.pay_fee(@entry_fee) == "Sorry"
      return "Bye"
    else
      @till += @entry_fee
      add_guest(guest)
    end
  end

end
