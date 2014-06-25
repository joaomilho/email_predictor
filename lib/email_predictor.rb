module EmailPredictor
  autoload :Predictor, 'email_predictor/predictor'
  
  def self.predict name, domain, dataset
    Predictor.new(dataset).predict(name, domain)
  end
end
