# frozen_string_literal: true

module UtmTracker
  module Helper
    UTM_TAGS = [
      "source",
      "campaign",
      "content",
      "medium",
      "term"
    ].freeze

    protected

    def get_utm_data
      session[:utm_data] = if utm_data_present?
        {
          source: params[:utm_source],
          campaign: params[:utm_campaign],
          content: params[:utm_content],
          medium: params[:utm_medium],
          term: params[:utm_term],
        }
      else
        {}
      end
    end

    def utm_data_present?
      UTM_TAGS.each do |tag|
        return true if params["utm_#{tag}".to_sym].present?
      end

      false
    end
  end
end
