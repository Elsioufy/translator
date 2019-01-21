require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'Title is not valid' do
    context 'Title is empty' do
      it 'should not save the article' do
        expect(build :article, title: '').not_to be_valid
      end
    end
    context 'Title is not unique' do
      it 'should not save the article' do
        create(:article, title: 'Title')
        expect(build :article, title: 'Title').not_to be_valid
      end
    end
  end

  context 'Body is not valid' do
    context 'Body is empty' do
      it 'should not save the article' do
        expect(build :article, body: '').not_to be_valid
      end
    end
    context 'Body is not unique' do
      it 'should not save the article' do
        create(:article, body: 'Body')
        expect(build :article, body: 'Body').not_to be_valid
      end
    end
  end
  context 'Title and Body are valid' do
    it 'should save the article' do
      expect(create(:article)).to be_valid
      expect{create(:article)}.to change { Article.count }.by(1)
    end
  end
end
