require_relative 'account'

module Bank
  class SavingsAccount < Account

    MINIMUM_BALANCE = 10
    WITHDRAWAL_FEE = 2

    def initialize(id, current_balance, date_created)
      super(id, current_balance, date_created)

    end

    def withdraw(withdraw_amt)
      super(withdraw_amt)
    end

    def add_interest_rate(rate)
      interest = @current_balance * rate/100
      return interest
    end

  end
end



sa = Bank::SavingsAccount.new(137, 100, "08-25-2016")
puts sa.withdraw(0)

#puts sa.withdraw(50)
#puts sa.withdraw(85)
puts sa.add_interest_rate(15)
