require 'rails_helper'

describe FacebookPage, 'validations' do
  it { expect(subject).to validate_presence_of :facebook_id     }
  it { expect(subject).to validate_presence_of :name            }
  it { expect(subject).to validate_presence_of :profile_picture }
end

