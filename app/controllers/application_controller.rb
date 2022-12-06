class ApplicationController < ActionController::Base

  def hello
    render html: "helo,world!"
  end



end
