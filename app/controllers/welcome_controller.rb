class WelcomeController < ApplicationController
  def index
    @outfits = Outfit.public
  end
end
