class HomeController < ApplicationController
  def index
    @entry = Entry.new
  end
end
