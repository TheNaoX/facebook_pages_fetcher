require 'rails_helper'

describe FacebookPage, 'validations' do
  it { expect(subject).to validate_presence_of(:facebook_id) }
end

