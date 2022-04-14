require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end
  describe 'メッセージ投稿' do
    context 'メッセージを保存できる' do
      it 'contentとimageがあれば保存できる' do
        expect(@message).to be_valid
      end
      it 'contentが空でも保存できる' do
        @message.content = ""
        expect(@message).to be_valid
      end
      it 'imageが空でも保存できる' do
        @message.image = nil
        expect(@message).to be_valid
      end
    end
    context 'メッセージを保存できない' do
      it 'contentとimageが空だと保存できない' do
        @message.image = nil
        @message.content = ""
        @message.valid?
        expect(@message.errors.full_messages).to include("Content can't be blank")
      end
      it 'userと紐付いていないと保存できない' do
        @message.user = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("User must exist")
      end
      it 'roomと紐付いていないと保存できない' do
        @message.room = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Room must exist")
      end
    end
  end
end
