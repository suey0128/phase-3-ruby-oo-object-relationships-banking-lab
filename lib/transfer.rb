class Transfer
  @@all = []

    def self.all
        @@all 
    end

    attr_reader :bank_account, :sender, :receiver, :amount
    attr_accessor :status

    def initialize sender, receiver, status = "pending", amount
        # @bank_account = bank_account
        @sender = sender
        @receiver = receiver
        @status = status
        @amount = amount
        @@all << self
    end

    def valid?
      self.sender.valid? && self.receiver.valid? ? true : false 
    end

    def execute_transaction
      #if the sender acc has enough balance && acc status is open
      @execute_transaction ||= transaction_helper
    end

    def reverse_transfer
      if self.status == "complete"
        self.sender.balance = self.sender.balance + self.amount
        self.receiver.balance = self.receiver.balance - self.amount
        self.status = "reversed"
      end
    end


    private 

    def transaction_helper
      if self.sender.balance > self.amount && self.sender.valid? == true && self.receiver.valid? == true
        self.sender.balance = self.sender.balance - self.amount
        self.receiver.balance = self.receiver.balance + self.amount
        self.status = "complete"
      else 
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end



end
