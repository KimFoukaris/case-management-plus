class ReportsController < ApplicationController
  before_action :require_logged_in

  def late_updates
    @updates = Update.late.incomplete
  end
end
