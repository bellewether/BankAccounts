module Bank
  class Account
    attr_reader :id
    attr_accessor :current_balance

    def initialize(id, current_balance)
      @id = id
      #@initial_balance = initial_balance (This is probably not necessary. Will decide later)
      @current_balance = current_balance
    end

    def withdraw(withdraw_amt)

    end

    def deposit(deposit_amt)

    end
  end
end
