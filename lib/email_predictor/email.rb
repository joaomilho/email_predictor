module EmailPredictor
  class Email
    attr_reader :user, :domain

    def initialize(email)
      @user, @domain = email.split('@')
    end

    def pattern
      @pattern ||= Patterns.evaluate(user)
    end
  end
end
