class HomeController < ApplicationController
  def index
    @status = Status.new
  end

  def internal_dashboard
  end

end
