require 'csv'

module Bank
  class Account
    attr_reader :id, :date_created
    attr_accessor :current_balance

    MINIMUM_BALANCE = 0
    WITHDRAWAL_FEE = 0

    def initialize(id, current_balance, date_created)
      @id = id
      @current_balance = current_balance
      if current_balance.to_i < self.class::MINIMUM_BALANCE
        raise ArgumentError.new("You can't do that. You need at least $#{ self.class::MINIMUM_BALANCE } to open an account.")
      else @current_balance = current_balance
      end
      @date_created = date_created
      #@owner = owner
    end

    def withdraw(withdraw_amt)
      @current_balance -= self.class::WITHDRAWAL_FEE
      
      if @current_balance < withdraw_amt + self.class::MINIMUM_BALANCE
        puts "WARNING: The amount you are trying to withdraw will put your balance below the $#{ self.class::MINIMUM_BALANCE } minimum!"
        @current_balance += self.class::WITHDRAWAL_FEE
      else
        @current_balance -= withdraw_amt
      end
      return @current_balance
    end

    def deposit(deposit_amt)
      @current_balance += deposit_amt
      return @current_balance
    end

    def self.all
      account_array = []
      CSV.read("/Users/yasminor/ada/class-exercises/project-forks/BankAccounts/support/accounts.csv").each_with_index do |line, i|
        account_array[i] = self.new(line[0], line[1], line[2])
      end
      return account_array
    end

    def self.find(id)
      object_array = Bank::Account.all
      object_array.each do |object|
        if object.id == id
          return object
        end
      end
    end

    # def add_owner(owner_object)
    #   @owner = owner_object
    # end

  end
end

#TEST
  # my_account = Bank::Account.new(137, 500, "8/24/2016")
  # puts my_account.withdraw(50)
#
# puts Bank::Account.all
# puts
# puts
# puts Bank::Account.find("15151")
