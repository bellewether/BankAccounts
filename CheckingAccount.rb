require_relative 'account'

module Bank
  class CheckingAccount < Account

    MINIMUM_BALANCE = 0
    WITHDRAWAL_FEE = 1

    def initialize(id, current_balance, date_created)
      super(id, current_balance, date_created)
      @num_checks_used = 0

    end

    def withdraw(withdraw_amt)
      super(withdraw_amt)
    end

    def withdraw_using_check(check_withdraw_amt)
      check_withdraw_fee = 2    # 3 free check uses, then a $2 check fee
      check_transaction_min_bal = -10
      @num_checks_used += 1     # keeps track of the number of checks used

      if @num_checks_used >= 4  # checks to see how many checks have been used so far
        @current_balance -= check_withdraw_fee  # if 4 or more have already been used, then a $2 fee is subtracted from current_balance
      end

      if @current_balance < check_withdraw_amt + check_transaction_min_bal  #
        puts "WARNING: The amount you are trying to withdraw will put your balance below the $#{ check_transaction_min_bal } minimum!"
        @current_balance += check_withdraw_fee
      else
        @current_balance -= check_withdraw_amt
      end

      return @current_balance
    end

    def reset_checks  # "every month" resets the number of checks used to 0
      @num_checks_used = 0
    end

  end
end

# ca = Bank::CheckingAccount.new(137, 100, "8-26-2016")
# puts ca.withdraw(50)

ca_two = Bank::CheckingAccount.new(138, 100, "8-26-2016")
puts ca_two.withdraw_using_check(30)
puts ca_two.withdraw_using_check(30)
puts ca_two.withdraw_using_check(30)
puts ca_two.withdraw_using_check(10)
ca_two.reset_checks
puts ca_two.withdraw_using_check(8)
