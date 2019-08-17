require 'rails_helper'

describe 'Requests from email', type: :request do
  before(:all) do
    @user = create(:user)
    create(:event)
  end

  it 'with invalid token' do
    expect(@user).not_to receive(:accept!)
    expect(@user).not_to receive(:reject!)

    get accept_path(token: 'invalid')
    get reject_path(token: 'invalid')
  end

  describe 'with valid token' do
    it '#accept' do
      expect(@user).not_to receive(:accept!)

      get accept_path(token: @user.token)
    end

    it '#reject' do
      expect(@user).not_to receive(:reject!)

      get accept_path(token: @user.token)
    end
  end
end
