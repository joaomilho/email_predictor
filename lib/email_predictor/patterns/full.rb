module EmailPredictor
  class Patterns::Full < Pattern
    def format
      [name, surname]
    end

    def match?
      name.full? and surname.full?
    end
  end
end
