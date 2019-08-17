require 'rails_helper'

describe Event do
  it 'sends emails to everyone' do
    event = build(:event)

    user1 = create(:user)
    user2 = create(:user)
    user3 = create(:user)

    mail = double
    expect(mail).to receive(:deliver!).exactly(3).times

    expect(UserMailer).to receive(:confirm).with(user1, event) { mail }
    expect(UserMailer).to receive(:confirm).with(user2, event) { mail }
    expect(UserMailer).to receive(:confirm).with(user3, event) { mail }

    event.save!
  end
end
