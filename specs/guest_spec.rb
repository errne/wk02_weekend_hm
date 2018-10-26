require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')
require_relative('../song')

class GuestTest < Minitest::Test

  def setup
    @favourite = Song.new("One")
  end

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
    assert_equal(25, guest2.pay_fee(25))
  end

  def test_guest_can_pay_fee__not_enough_funds
    guest2a = Guest.new("Pavaro", 14, @favourite)
    assert_equal("Sorry", guest2a.pay_fee(15))
    assert_equal(14, guest2a.check_wallet)
  end

  def test_guest_has_favourite_song
    guest2 = Guest.new("Pavaroti", 225, @favourite)
    assert_equal("One", guest2.get_favourite_tune().title)
  end

  def test_guest_can_cheer_loudly
    guest1 = Guest.new("Vidal", 120, @favourite)
    assert_equal("Hell Yeah", guest1.cheer_loudly())
  end



end
