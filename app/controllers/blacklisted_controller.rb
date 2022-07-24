class BlacklistedController < ApplicationController
  before_action :block_ip_addresses

  def index
    @ip_address = current_ip_address
    Blacklist.create(path: request.original_url, ip: @ip_address)
  end
end
