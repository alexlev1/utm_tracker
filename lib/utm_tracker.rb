# frozen_string_literal: true

require "utm_tracker/version"

module UtmTracker
  class Client
    attr_accessor :object, :utm_data

    def initialize(object, utm_data)
      @object = object
      @utm_data = utm_data
    end

    def call
      decode_utm_data
      save_utm_tags_into_database!
    end

    private

    def decode_utm_tags
      utm_data = utm_data.select{|k, v| v.present?}.each{|k, v| data[k] = CGI.unescape(v)}
    end

    def save_utm_tags_into_database!
      object.update!(utm_data: utm_data)
    end
  end
end
