require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../song')
require_relative('../guest')

class RoomTest < Minitest::Test

  def setup
    song1 = Song.new("One")
    song2 = Song.new("Under the Bridge")
    song3 = Song.new("November rain")
    song4 = Song.new("About a girl")

    @song5 = Song.new("Crazy")

    songslist = [song1, song2, song3, song4]

    @guest1 = Guest.new("Bo", 45, song4)
    @guest2 = Guest.new("Stu", 68, song1)

    @room1 = Room.new("Rock room", 15, songslist)
    @room2 = Room.new("Awful music room", 1, songslist)

  end

  def test_room_has_theme
    assert_equal("Rock room", @room1.theme)
  end

  def test_room_has_capacity
    assert_equal(15, @room1.capacity)
  end

  def test_room_has_guests_array
    assert_equal(0, @room1.guest_count)
  end

  def test_room_has_songslist
    assert_equal(4 , @room1.songslist.length)
    assert_equal("One", @room1.songslist[0].title)
  end

  def test_add_guest_to_room
    @room1.add_guest(@guest1)
    assert_equal(1, @room1.guest_count())
  end

  def test_add_guststo_room__when_room_full
    @room2.add_guest(@guest1)
    assert_equal("Sorry, the room is full", @room2.add_guest(@guest2))

  end

  def test_room_guest_can_leave_room
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest2)
    @room1.guest_remove(@guest1)
    assert_equal(1, @room1.guest_count())
  end

  def test_how_much_spaces_left
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest2)
    assert_equal(13, @room1.count_spaces_left)
    assert_equal(15, @room1.capacity)
  end

  def test_room_can_add_song
    @room1.add_song(@song5)
    assert_equal(5 , @room1.songslist.length)
    assert_equal("Crazy", @room1.songslist[4].title)

  end


end
