require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'Question is not valid' do
    context 'Question is empty' do
      it 'should not save the article' do
        skip
        pending "Fix validation problem with rails admin"
        expect(build :article, question: '').not_to be_valid
      end
    end
    context 'Question is not unique' do
      it 'should not save the article' do
        skip
        pending "Fix validation problem with rails admin"
        create(:article, question: 'Question?')
        expect(build :article, question: 'Question?').not_to be_valid
      end
    end
  end

  context 'Answer is not valid' do
    context 'Answer is empty' do
      it 'should not save the article' do
        skip
        pending "Fix validation problem with rails admin"
        expect(build :article, answer: '').not_to be_valid
      end
    end
    context 'Answer is not unique' do
      it 'Answer not save the article' do
        skip
        pending "Fix validation problem with rails admin"
        create(:article, answer: 'Answer')
        expect(build :article, answer: 'Answer').not_to be_valid
      end
    end
  end
  context 'Question and Answer are valid' do
    it 'should save the article' do
      expect(build(:article)).to be_valid
      expect{create(:article)}.to change { Article.count }.by(1)
    end
  end
end
