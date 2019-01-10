# For secret token
require 'token_secret'

class ApplicationController < ActionController::API

  # Defined in TokenSecret file
  include TokenSecret

# Validations with JWT

  def encode_token(payload)
    JWT.encode(payload, secret)
  end

  def aut_header
    request.headers['Authorization']
  end

  def decoded_token(token)
      JWT.decode(token, 'all_heed_the_fool')[0]
  end

end
