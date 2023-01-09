# frozen_string_literal: true

module UtmTracker
  module Helper
    protected

    def get_utm_data
      session[:utm_data] = {
        source: params[:utm_source],
        medium: params[:utm_medium],
        content: params[:utm_content],
        campaign: params[:utm_campaign],
        term: params[:utm_term],
      }
    end
  end
end
