class OysterCard 

LIMIT = 100
MINIMUM_BALANCE = 1
MINIMUM_FARE = 5

  attr_reader :balance, :in_journey

  def initialize(balance = 0)
    @balance = balance 
    @in_journey = false
  end

  def top_up(amount)
    total = @balance + amount
    raise top_up_amount_error(amount) if total > LIMIT

    @balance += amount
  end

  def deduct(fare = MINIMUM_FARE)
    @balance -= fare
  end

  def touch_in
    raise minimum_balance_error if @balance < MINIMUM_BALANCE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  private 

  def top_up_amount_error(amount)
    message = "Can't exceed #{LIMIT} with #{amount}"
    BalanceError.new(message)
  end

  def minimum_balance_error
    message = "Insuffient funds, please top up by minimum balance #{MINIMUM_BALANCE}"
    JourneyError.new(message)
  end

end

class BalanceError < StandardError
end

class JourneyError < StandardError
end