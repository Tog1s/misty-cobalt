class ApplicationController < ActionController::Base

  protected

  def current_ip_address
    request.env['HTTP_X_REAL_IP'] || request.env['REMOTE_ADDR']
  end

  def block_ip_addresses
    head :forbidden if Blacklist.exists?(ip: current_ip_address)
  end
end
