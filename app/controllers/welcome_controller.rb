class WelcomeController < ApplicationController
  before_action :block_ip_addresses

  def index
    if params[:n]
      n = params[:n].to_f
      @squire = n * n
    end
  end
end
