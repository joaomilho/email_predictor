module EmailPredictor
  module Patterns
    autoload :Initials,       'email_predictor/patterns/initials'
    autoload :InitialName,    'email_predictor/patterns/initial_name'
    autoload :InitialSurname, 'email_predictor/patterns/initial_surname'
    autoload :Full,           'email_predictor/patterns/full'

    def self.patterns
      constants.map{ |pattern| self.const_get(pattern) }
    end

    def self.evaluate(user)
      patterns.find{ |pattern| pattern.match?(user) }
    end
  end
end
