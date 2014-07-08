module EmailPredictor
  class Patterns::Initials < Pattern
    def format
      [name.initial, surname.initial]
    end

    def match?
      name.initial? and surname.initial?
    end
  end
end
