class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :registerable, :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable, :omniauth_providers => [:facebook]

  has_many :routines, inverse_of: :user

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end 
    end

  def bmi
    metric_weight = weight * 0.45
    metric_height = height * 0.025
    sqrt_metric_height = metric_height * metric_height
    bmi = metric_weight/sqrt_metric_height
    bmi.round
  end

  def incomplete_profile?
    height.nil? || weight.nil? 
  end  

end



