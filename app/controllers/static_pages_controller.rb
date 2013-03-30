class StaticPagesController < ApplicationController
  def home
    @micropost = current_user.microposts.build if signed_in?
    @placeholders = ['Tell me more about your cat...',
                     'What did you have for lunch?',
                     "Ooooh, girl. No shit ditn't...",
                     'Airline food IS terrible!']
  end

  def help
  end

  def about
  end

  def contact
  end
end
