class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def spotify

    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    spotify_user_hash = spotify_user.to_hash
    print spotify_user_hash
    user = User.find_for_spotify_oauth(spotify_user_hash)
    

    if user.persisted?
      sign_in_and_redirect user, event: :authentication
      set_flash_message(:notice, :success, kind: 'Spotify') if is_navigational_format?
    else
      session['devise.spotify_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end