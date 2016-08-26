require 'csv'

module Bank
  class Account
    attr_reader :id, :date_created
    attr_accessor :current_balance

    MINIMUM_BALANCE = 0
    WITHDRAWAL_FEE = 0

    def initialize(id, current_balance, date_created)
      @id = id
      if current_balance.to_i < self.class::MINIMUM_BALANCE # An account can't be initialized with a negative amount of money. If user attempts to, an ArgumentError is raised
        raise ArgumentError.new("You need at least $#{ self.class::MINIMUM_BALANCE } to open an account.")
      else
        @current_balance = current_balance
      end
      @date_created = date_created
    end

    def withdraw(withdraw_amt)
      @current_balance -= self.class::WITHDRAWAL_FEE

      if @current_balance < withdraw_amt + self.class::MINIMUM_BALANCE  # Throw a warning if user attempts to withdraw an amount that will put their account in the negative and prevent the withdrawal
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

    def self.all # This class method reads elements from a CSV file and writes them into an array as a collection of Account instances
      account_array = []
      CSV.read("/Users/yasminor/ada/class-exercises/project-forks/BankAccounts/support/accounts.csv").each_with_index do |line, i|
        account_array[i] = self.new(line[0], line[1], line[2]) #using csv elements and self to create and add new Account instances to an array
      end
      return account_array
    end

    def self.find(id)
      object_array = Bank::Account.all
      object_array.each do |object|
        if object.id.to_i == id # convert object id from a string to an fixnum as the user is likely to input the id as a fixnum
          return object
        end
      end
    end
  end
end

#TEST
# my_account = Bank::Account.new(137, 49, "8/24/2016")
# puts my_account.withdraw(50)
#
#puts Bank::Account.all
# puts
# puts
#puts Bank::Account.find(15151)
