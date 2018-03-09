class UsersController < ApplicationController 
  def show
    @user = User.find(params[:id])
    if (current_user && current_user.id == @user.id)
      @outfits = @user.outfits
    else
      @outfits = @user.outfits.public
    end
  end
end
