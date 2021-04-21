require 'rails_helper'

RSpec.describe Recruitment, type: :model do
  before do
    user = FactoryBot.create(:user)
    @recruitment = FactoryBot.build(:recruitment, user_id: user.id)
    
  end

  describe '新規募集' do
    context '新規募集ができるとき' do
      it 'event_date,start_time,end_time,place.number_of_people,category_id,description,user_id,prefecture_idが存在すれば登録できること' do
        expect(@recruitment).to be_valid
      end
    end
    context '新規募集ができないとき' do
      it 'event_dateが空の時保存できないこと' do
        @recruitment.event_date = ''
        @recruitment.valid?
        expect(@recruitment.errors.full_messages).to include("Event date can't be blank")
      end
      it 'event_dateが現在より過去の日付を選択した時保存できないこと' do
        @recruitment.event_date = '2000-01-01'
        @recruitment.valid?
        expect(@recruitment.errors.full_messages).to include("Event date can't select a date in the past")
      end
      it 'start_timeが空だと保存できないこと' do
        @recruitment.start_time = ''
        @recruitment.valid?
        expect(@recruitment.errors.full_messages).to include("Start time can't be blank")
      end
      it 'end_timeが空だと保存できないこと' do
        @recruitment.end_time = ''
        @recruitment.valid?
        expect(@recruitment.errors.full_messages).to include("End time can't be blank")
      end
      it 'end_timeがstart_timeより遅いと保存できないこと' do
        @recruitment.start_time = '12:00'
        @recruitment.end_time = '10:00'
        @recruitment.valid?
        expect(@recruitment.errors.full_messages).to include("End time can't select a time later than the start time")
      end
      it 'placeが空だと保存できないこと' do
        @recruitment.place = ''
        @recruitment.valid?
        expect(@recruitment.errors.full_messages).to include("Place can't be blank")
      end
      it 'number_of_peopleが空だと保存できないこと' do
        @recruitment.number_of_people = ''
        @recruitment.valid?
        expect(@recruitment.errors.full_messages).to include("Number of people can't be blank")
      end
      it 'number_of_peopleが全角数字だと保存できないこと' do
        @recruitment.number_of_people = '５'
        @recruitment.valid?
        expect(@recruitment.errors.full_messages).to include('Number of people is only half-width number')
      end
      it 'number_of_peopleが英数混合だと保存できないこと' do
        @recruitment.number_of_people = '2s34dg'
        @recruitment.valid?
        expect(@recruitment.errors.full_messages).to include('Number of people is only half-width number')
      end
      it 'number_of_peopleが半角英語だと保存できないこと' do
        @recruitment.number_of_people = 'abcdef'
        @recruitment.valid?
        expect(@recruitment.errors.full_messages).to include('Number of people is only half-width number')
      end
      it 'categoryを選択していないと保存できないこと' do
        @recruitment.category_id = 0
        @recruitment.valid?
        expect(@recruitment.errors.full_messages).to include('Category Select')
      end
      it 'descriptionが空だと保存できないこと' do
        @recruitment.description = ''
        @recruitment.valid?
        expect(@recruitment.errors.full_messages).to include("Description can't be blank")
      end
      it 'prefectureが空だと保存できないこと' do
        @recruitment.prefecture_id = nil
        @recruitment.valid?
        expect(@recruitment.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'userが紐づいていないと保存できないこと' do
        @recruitment.user = nil
        @recruitment.valid?
        expect(@recruitment.errors.full_messages).to include('User must exist')
      end
    end
  end
end
