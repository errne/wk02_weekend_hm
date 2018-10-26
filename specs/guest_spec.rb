require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')
require_relative('../song')

class GuestTest < Minitest::Test
  @favourite = Song.new("One")

  def test_guest_has_name
    guest1 = Guest.new("Vidal", 120, @favourite)
    assert_equal("Vidal", guest1.name)
  end

  def test_guest_can_check_wallet
    guest2 = Guest.new("Pavaroti", 225, @favourite)
    assert_equal(225, guest2.check_wallet())
  end

  def test_guest_can_pay_fee
    guest2 = Guest.new("Pavaroti", 225, @favourite)
    guest2.pay_fee(25)
    assert_equal(200, guest2.check_wallet)
  end

  def test_guest_has_favourite_song
    guest2 = Guest.new("Pavaroti", 225, @favourite)
  end

end
