require 'rails_helper'

describe Contact, type: :model do
  describe 'relationships' do
    it {should belong_to :company}
  end
end
