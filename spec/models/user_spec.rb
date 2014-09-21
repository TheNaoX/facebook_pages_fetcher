require 'rails_helper'

describe User, "associations" do
  it { expect(subject).to have_many(:facebook_pages) }
end
