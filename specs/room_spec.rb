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
    @guest3 = Guest.new("Pooh", 14, song1)

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

  def test_guests_can_cheer
    assert_equal("Hell Yeah", @room1.check_feedback(@guest1))
  end

  def test_room_has_till
    assert_equal(25, @room1.check_till())
  end

  def test_room_can_accept_entry_fee
    @room1.charge_entry_fee(@guest1)
    assert_equal(1, @room1.guest_count())
    assert_equal(14, @room1.count_spaces_left)
    assert_equal(40, @room1.check_till())
    assert_equal(30, @guest1.check_wallet)
  end

  def test_room_can_accept_entry_fee__room_full
    @room2.charge_entry_fee(@guest1)
    @room2.charge_entry_fee(@guest2)
    assert_equal(1, @room2.guest_count())
    assert_equal(0, @room2.count_spaces_left)
    assert_equal(40, @room2.check_till())
    assert_equal(30, @guest1.check_wallet)
    assert_equal(68, @guest2.check_wallet)
  end

  def test_room_can_accept_entry_fee__guest_no_money
    @room1.charge_entry_fee(@guest3)
    assert_equal(0, @room1.guest_count())
    assert_equal(25, @room1.check_till())
    assert_equal(14, @guest3.check_wallet)
    assert_equal("Bye", @room1.charge_entry_fee(@guest3))
  end



end
