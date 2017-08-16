class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         omniauth_providers: [:spotify]

   has_many :setlists, dependent: :destroy
   has_many :comments, dependent: :nullify
   has_many :votes, dependent: :destroy
   has_many :favorites, dependent: :destroy




  def self.find_for_spotify_oauth(auth)
    user_params = {}
    user_params[:country] = auth['country']
    user_params[:email] =  auth['email']
    user_params[:username] = auth["id"]
    user_params[:uri] = auth["uri"]
    user_params[:name] = auth["display_name"]
    user_params[:image] = auth['images'][0].url
    user_params[:token] = auth['credentials'].token
    user_params[:refresh_token] = auth['credentials'].refresh_token
    p "Refresh Token is: #{user_params[:refresh_token]}"
    user_params[:token_expiry] = Time.at(auth['credentials'].expires_at)
    user_params[:spotify_id] = auth['id']
    user_params = user_params.to_h

    user = User.find_by(username: auth['id'])
    user ||= User.find_by(email: auth['email']) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end
end
