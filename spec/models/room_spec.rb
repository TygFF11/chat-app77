require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end
  describe 'ルーム作成' do
    context 'ルーム作成できる' do
      it 'nameが存在するとルームが作成できる' do
        expect(@room).to be_valid
      end
    end
    context 'ルーム作成できない' do 
      it 'nameが空だとルームが作成できない' do
        @room.name = ""
        @room.valid?
        expect(@room.errors.full_messages).to include("Name can't be blank")
      end
    end
  end 
end
