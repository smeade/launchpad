class User < ActiveRecord::Base

  # class methods from other classes or modules
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:github]

  # associations
  belongs_to :account
  has_many :comments

  # callbacks
  after_create :set_account

  def subdomain=(subdomain)
    account = self.account || self.create_account(name: 'Your Account')
    account.update_attributes(subdomain: subdomain)
  end

  def subdomain
    self.account.try(:subdomain)
  end

  def set_account
    account = self.account || self.create_account(name: 'Your Account')
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      puts auth.info.inspect
      user.email = auth.info.email || 'uknown@example.com'
      user.password = Devise.friendly_token[0,20]
      user.full_name = auth.info.name if auth.info.name
      user.nick_name = auth.info.nickname
    end
  end

end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#  provider               :string(255)
#  uid                    :string(255)
#  full_name              :string(255)
#  nick_name              :string(255)
#
