# frozen_string_literal: true

require_relative "utm_tracker/version"
require_relative "utm_tracker/helper"
require_relative "utm_tracker/matcher"

module UtmTracker
  class Client
    attr_accessor :object, :utm_matcher

    def initialize(object, utm_data)
      @object = object
      @utm_matcher = UtmTracker::Matcher.new(utm_data)
    end

    def call
      return :nok if utm_matcher.utm_data.nil?

      match_utm_tags
      save_utm_tags_into_database!
      :ok
    end

    protected

    def match_utm_tags
      @utm_matcher.call
    end

    def save_utm_tags_into_database!
      object.update!(utm_data: @utm_matcher.utm)
    end
  end
end
