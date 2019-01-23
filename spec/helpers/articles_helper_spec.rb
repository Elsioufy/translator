require 'rails_helper'

describe ArticlesHelper, type: :helper do
  describe "Truncate article" do
    context 'Text length is bigger than truncated characters' do
      it 'Should truncate value' do
        text = Faker::String.random(50)
        number = 30
        expect(article_truncate(text,number).length).to eq(number)
      end
    end
    context 'Text length is smaller than truncated characters' do
      it 'Should not truncate value' do
        text = Faker::String.random(4)
        number = 30
        expect(article_truncate(text,number).length).to eq(text.length)
      end
    end
  end
end
