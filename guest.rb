class Guest

attr_reader :name

  def initialize(name, wallet)
    @name = name
    @wallet = wallet
  end

  def check_wallet()
    return @wallet
  end

  def pay_fee(fee)
    @wallet -= fee
  end

end
