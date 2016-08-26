require 'csv'

module Bank
  class Owner
    attr_reader :id, :last_name, :first_name, :street_address, :city, :state
    #attr_accessor

    def initialize(id, last_name, first_name, street_address, city, state)
      @id = id
      @last_name = last_name
      @first_name = first_name
      @street_address = street_address
      @city = city
      @state = state

    end

    def self.all
      owner_array = []
      CSV.read("/Users/yasminor/ada/class-exercises/project-forks/BankAccounts/support/accounts.csv").each_with_index do |line, i|
        owner_array[i] = self.new(line[0], line[1], line[2], line[3], line[4], line[5])
      end
      return owner_array
    end

    def self.find(id)
      owner_obj_array = Bank::Owner.all
      owner_obj_array.each do |object|
        if object.id == id
          return object
        end
      end
    end

  end
end


# puts Bank::Owner.all
# puts
# puts
puts Bank::Owner.find(25)
