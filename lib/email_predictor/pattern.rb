class EmailPredictor::Pattern
  attr_reader :name, :surname

  def initialize(user)
    @name, @surname = user.downcase.split(/[. ]/)
  end

  def self.match?(user)
    new(user).match? rescue false
  end

  def self.format(user, domain)
    new(user).format.join('.') + '@' + domain
  end
end
