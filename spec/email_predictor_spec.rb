require_relative '../lib/email_predictor'

describe EmailPredictor do
  describe '.predict' do
    before do 
      allow_any_instance_of(EmailPredictor::Predictor).to receive(:predict).and_return("delegated")
    end

    subject(:prediction) do
      EmailPredictor.predict('a', 'b', {})
    end

    it 'delegates the prediction to Predictor#predict' do
      expect(prediction).to eq('delegated')
    end
  end
end
