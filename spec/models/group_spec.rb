require 'rails_helper'

describe Group do
  describe '#appoint_leader!' do
    it 'makes as leader a person who least was leader' do
      user1 = create(:user)
      user2 = create(:user)
      user3 = create(:user)

      group1 = create(:group, leader: user1, users: [user1, user2, user3], created_at: '2019-01-01')
      group2 = create(:group, leader: user2, users: [user1, user2, user3], created_at: '2019-01-02')
      group3 = create(:group, users: [user1, user2, user3])

      group3.appoint_leader!

      expect(group3.leader).to eq user3

      group4 = create(:group, users: [user1, user2, user3])
      group4.appoint_leader!

      expect(group4.leader).to eq user1
    end
  end
end
