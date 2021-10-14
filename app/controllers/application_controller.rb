class ApplicationController < ActionController::Base
  
  def hello
    render html: "hollo, world!"
  end
end
