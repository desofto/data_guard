require 'rails_helper'

describe Unit do
  describe '#name' do
    it 'invalid when empty' do
      unit = build(:unit, name: '')

      expect(unit).to be_invalid
    end

    it 'valid when filled in' do
      unit = build(:unit, name: 'some name')

      expect(unit).to be_valid
    end
  end
end
