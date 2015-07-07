require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:uid) }
  it { should validate_presence_of(:provider) }
  it { should_not allow_value("lol@lol").for(:email) }
  it { should allow_value("lol@lol.com.es").for(:email) }
end
