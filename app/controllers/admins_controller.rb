class Admins < ApplicationController
  before_filter :authenticate_admin!
end