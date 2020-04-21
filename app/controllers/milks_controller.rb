# frozen_string_literal: true

class MilksController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    @milks = Milks.all
  end
end
