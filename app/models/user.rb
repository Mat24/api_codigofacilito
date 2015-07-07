class  User < ActiveRecord::Base
  has_many :tokens
  validates :email, presence: true, email: true
  validates :provider, presence: true
  validates :uid, presence: true

  def self.from_omniauth(data)
    User.where(provider: data[:provider], uid: data[:uid], email: data[:info][:email]).first_or_create
  end

end
