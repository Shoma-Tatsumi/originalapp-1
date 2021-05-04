# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    context 'コメント投稿できるとき' do
      it 'コメントが存在すればコメントできる' do
        expect(@comment).to be_valid
      end
    end
    context 'コメント投稿できないとき' do
      it 'コメントが空のときコメントできない' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
      it 'ユーザーが紐付いていなければコメントできない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('User must exist')
      end
      it '募集が紐付いていなければコメントできない' do
        @comment.recruitment = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Recruitment must exist')
      end
    end
  end
end
