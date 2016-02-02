require 'rails_helper'

RSpec.describe Company, type: :model do
  before do
    @company = create_company
  end

  describe '#premium?' do
    context 'has zero jobs' do
      it 'is not premium' do
        expect(@company).to_not be_premium
      end
    end

    context 'has 4 jobs' do
      it 'is not premium' do
        4.times do
          create_job(@company)
        end
        expect(@company).to_not be_premium
      end
    end

    context 'has 5 jobs' do
      it 'is premium' do
        5.times do
          create_job(@company)
        end
        expect(@company).to be_premium
      end
    end

    context 'has 10 jobs' do
      it 'is premium' do
        10.times do
          create_job(@company)
        end
        expect(@company).to be_premium
      end
    end
  end
end
