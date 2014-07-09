require 'spec_helper'

describe EmailPredictor::Predictor do

  describe '.predict' do
    subject :prediction do
      EmailPredictor::Predictor.new(dataset).predict('Ludwig Wittgenstein', 'cambridge.edu')
    end

    context 'simple datasets' do
    context 'given a dataset with full name and full surname' do
      let(:dataset) do
        {
          'Bertrand Russell' => 'bertrand.russell@cambridge.edu'
        }
      end

      it 'returns an email with full name and full surname' do
        expect(prediction).to eq(['ludwig.wittgenstein@cambridge.edu'])
      end
    end

    context 'given a dataset with full name and initial surname' do
      let(:dataset) do
        {
          'Francis Bacon' => 'francis.b@cambridge.edu'
        }
      end

      it 'returns an email with full name and initial surname' do
        expect(prediction).to eq(['ludwig.w@cambridge.edu'])
      end
    end

    context 'given a dataset with initial name and full surname' do
      let(:dataset) do
          {
            'Alfred Whitehead' => 'a.whitehead@cambridge.edu'
          }
        end

        it 'returns an email with initial name and full surname' do
          expect(prediction).to eq(['l.wittgenstein@cambridge.edu'])
        end
      end

      context 'given a dataset with initial name and initial surname' do
        let(:dataset) do
          {
            'Henry Sidgwick' => 'h.s@cambridge.edu'
          }
        end

        it 'returns an email with initial name and initial surname' do
          expect(prediction).to eq(['l.w@cambridge.edu'])
        end
      end
    end

    context 'complex datasets' do
      context 'given a dataset with two emails and two patterns' do
        let(:dataset) do
          {
            'George Moore' => 'g.m@cambridge.edu',
            'John McTaggart' => 'john.mctaggart@cambridge.edu'
          }
        end

        it 'returns the two patterns sorted anyway' do
          expect(prediction).to eq(['ludwig.wittgenstein@cambridge.edu', 'l.w@cambridge.edu'])
        end
      end

      context 'given a dataset with three emails and two patterns' do
        let(:dataset) do
          {
            'Iris Murdoch' => 'john.mctaggart@cambridge.edu',
            'Elizabeth Anscombe' => 'e.a@cambridge.edu',
            'Bernard Williams' => 'b.w@cambridge.edu'
          }
        end

        it 'returns the two patterns sorted by occurrence' do
          expect(prediction).to eq(['l.w@cambridge.edu', 'ludwig.wittgenstein@cambridge.edu'])
        end
      end

      context 'given a dataset with all patterns' do
        let(:dataset) do
          {
            'Frank Ramsey'       => 'f.r@cambridge.edu',
            'Amartya Sen'        => 'amartya.s@cambridge.edu',
            'Judith Thomson'     => 'judith.t@cambridge.edu',
            'Ian Hacking'        => 'i.hacking@cambridge.edu',
            'Roger Scruton'      => 'r.scruton@cambridge.edu',
            'Henry Sidgwick'     => 'h.sidgwick@cambridge.edu',
            'Desiderius Erasmus' => 'desiderius.erasmus@cambridge.edu',
            'John Grote'         => 'john.grote@cambridge.edu',
            'William Whewell'    => 'william.whewell@cambridge.edu',
            'James Ward'         => 'james.ward@cambridge.edu'
          }
        end

        it 'returns all patterns sorted by occurrence' do
          expect(prediction).to eq([
            'ludwig.wittgenstein@cambridge.edu',
            'l.wittgenstein@cambridge.edu',
            'ludwig.w@cambridge.edu',
            'l.w@cambridge.edu'
          ])
        end
      end

      context 'given a dataset without the domain' do
        let(:dataset) do
          {
            'John Locke' => 'john.locke@oxford.edu'
          }
        end

        it 'raises domain not found error' do
          expect(prediction).to eq([])
        end
      end

      context 'given a dataset with an unexpected pattern' do
        let(:dataset) do
          {
            'Hugh Mellor' => 'hugh@cambridge.edu'
          }
        end

        it 'raises pattern not found error' do
          expect(prediction).to eq([])
        end
      end

      context 'given a dataset without both expected and unexpected pattern' do
        let(:dataset) do
          {
            'Huw Price'       => 'huw@cambridge.edu',
            'Simon Blackburn' => 's.b@cambridge.edu'
          }
        end

        it 'returns an email with the expected pattern' do
          expect(prediction).to eq(['l.w@cambridge.edu'])
        end
      end

    end
  end
end

