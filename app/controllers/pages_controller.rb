class PagesController < ApplicationController
  before_filter :authorize

  def welcome
  end

end
