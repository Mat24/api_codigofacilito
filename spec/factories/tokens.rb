 FactoryGirl.define do
  factory :token do
    expires_at "2015-07-07 11:46:26"
    association :user, factory: :user
  end
end
