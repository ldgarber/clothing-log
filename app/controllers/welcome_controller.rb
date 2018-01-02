class WelcomeController < ApplicationController
  def index
    if !user_signed_in? 
      redirect_to new_user_session_path
    end
    @outfits = Outfit.public
  end
end
