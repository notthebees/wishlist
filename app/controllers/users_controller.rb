class UsersController < ApplicationController
  skip_before_request :verify_authenticity_token
end
