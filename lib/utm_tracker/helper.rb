# frozen_string_literal: true

module UtmTracker
  module Helper
    protected

    def get_utm_data
      session[:utm_data] ||= params[:utm_data]
    end
  end
end
