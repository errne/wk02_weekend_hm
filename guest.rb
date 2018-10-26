require_relative('./song')
class Guest

attr_reader :name

  def initialize(name, wallet, favourite_tune)
    @name = name
    @wallet = wallet
    @favourite_tune = favourite_tune
  end

  def check_wallet()
    return @wallet
  end

  def pay_fee(fee)
    @wallet -= fee
  end

  def get_favourite_tune()
    return @favourite_tune
  end

  def cheer_loudly()
    return "Hell Yeah"
  end

end
