module EmailPredictor
  class Patterns::InitialName < Pattern
    def format
      [name.initial, surname]
    end

    def match?
      name.initial? and surname.full?
    end
  end
end
