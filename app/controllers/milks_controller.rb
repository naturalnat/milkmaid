class MilksController < ApplicationController
  before_action :redirect_if_not_logged_in

    def index
      @milks = Milks.alpha
    end

end
