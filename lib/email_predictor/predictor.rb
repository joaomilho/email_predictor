module EmailPredictor
  class Predictor
    def initialize(bulk_data)
      @dataset = Dataset.new(bulk_data.values)
    end

    def predict(name, domain)
      @dataset[domain].map do |pattern|
        pattern.format(name, domain)
      end
    end
  end
end
