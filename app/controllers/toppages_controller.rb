class ToppagesController < ApplicationController
  def index
    @custom = Custom.new
  end
end
