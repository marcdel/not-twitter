class MicropostsController < ApplicationController
  before_filter :signed_in_user

  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = 'Congratulations, you just made a post. On the internet!'
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end
end