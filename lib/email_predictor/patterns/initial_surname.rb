module EmailPredictor
  class Patterns::InitialSurname < Pattern
    def format
      [name, surname.initial]
    end

    def match?
      name.full? and surname.initial?
    end
  end
end
