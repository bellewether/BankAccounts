module Bank
  class Account
    attr_reader :id
    attr_accessor :current_balance

    def initialize(id, current_balance)
      @id = id
      #@initial_balance = initial_balance (This is probably not necessary. Will decide later)
      @current_balance = current_balance
    end

    # Create a method to randomly assign an id to an account later
    # def assign_id()
    # end

    def withdraw(withdraw_amt)
      if @current_balance < withdraw_amt
        puts "WARNING: You cannot withdraw an amount greater than your current balance!"
      else
        @current_balance -= withdraw_amt
      end
      return @current_balance
    end

    def deposit(deposit_amt)
      @current_balance += deposit_amt
      return @current_balance
    end
  end
end
