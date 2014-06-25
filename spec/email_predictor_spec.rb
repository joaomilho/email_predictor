require_relative '../lib/email_predictor'

describe EmailPredictor do
  describe '.predict' do
    subject :prediction do
      EmailPredictor.predict 'Ludwig Wittgenstein', 'cambrige.edu', dataset
    end

    context 'given a dataset with first name and last name' do
      let(:dataset) do
        {
          'Bertrand Russell' => 'bertrand.russell@cambridge.edu'
        }
      end

      it 'returns an email with first name and last name' do
        expect(prediction).to eq('ludwig.wittgenstein@cambridge.edu')
      end
    end

    context 'given a dataset with first name and last initial' do
      let(:dataset) do
        {
          'Francis Bacon' => 'francis.b@cambridge.edu'
        }
      end

      it 'returns an email with first name and last initial' do
        expect(prediction).to eq('ludwig.w@cambridge.edu')
      end
    end
  end
end
