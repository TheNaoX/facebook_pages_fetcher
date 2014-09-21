require 'rails_helper'

describe FacebookPage, 'validations' do
  it { expect(subject).to validate_presence_of :facebook_id     }
  it { expect(subject).to validate_presence_of :name            }
  it { expect(subject).to validate_presence_of :profile_picture }
  it { expect(subject).to validate_uniqueness_of :facebook_id   }
end

describe FacebookPage do
  let(:picture)     { "foo"          }
  let(:name)        { "Tigerlily"    }
  let(:facebook_id) { "188091757763" }

  describe ".create_page" do
    context "with valid attributes" do
      it "creates the page" do
        expect {
          FacebookPage.create_page(facebook_id, name, picture)
        }.to change(FacebookPage, :count).by(1)
      end
    end

    context "with invalid attributes" do
      it "does not create the page if the facebook id is not present" do
        expect {
          FacebookPage.create_page(nil, name, picture)
        }.to raise_error(Mongoid::Errors::Validations)
      end

      it "does not create the page if the name is not present" do
        expect {
          FacebookPage.create_page(facebook_id, nil, picture)
        }.to raise_error(Mongoid::Errors::Validations)
      end

      it "does not create the page if the picture is not present" do
        expect {
          FacebookPage.create_page(facebook_id, name, nil)
        }.to raise_error(Mongoid::Errors::Validations)
      end
    end
  end
end
