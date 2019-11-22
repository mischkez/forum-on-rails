class PagesController < ApplicationController
  def index
    @questions = Question.page params[:page]
  end

  def about
  end
end
