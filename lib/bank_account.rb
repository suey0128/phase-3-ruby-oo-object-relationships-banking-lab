class BankAccount
    @@all = []

    def self.all
        @@all 
    end

    attr_reader :name
    attr_accessor :balance, :status

    def initialize name, balance=1000, status="open"
        @name = name
        @balance = balance
        @status = status
        @@all << self
    end

    def deposit amount
        @balance = @balance + amount
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        #open status && balance > 0 
        self.balance > 0 && self.status == "open" ? true : false
    end

    def close_account
        self.status = "closed"
    end
end
