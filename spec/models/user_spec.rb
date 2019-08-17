require 'rails_helper'

describe User do
  describe '#send_confirmation' do
    it 'sends email' do
      user = create(:user, will_go: true)
      event = build(:event)

      mail = double
      expect(mail).to receive(:deliver!)

      expect(UserMailer).to receive(:confirm).with(user, event) { mail }

      expect(user).to receive(:regenerate_token)

      user.send_confirmation(event)

      expect(user.will_go).to eq nil
    end
  end

  describe '#send_notification' do
    it 'sends email' do
      user = create(:user)
      group = build(:group)

      mail = double
      expect(mail).to receive(:deliver!)

      expect(UserMailer).to receive(:notification).with(user, group) { mail }

      user.send_notification(group)
    end
  end
end
