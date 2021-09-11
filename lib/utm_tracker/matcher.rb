module UtmTracker
  class Matcher
    attr_accessor :utm_data, :utm

    def initialize(utm_data, utm = {})
      @utm_data = utm_data
      @utm = utm
    end

    def call
      utm_source
      utm_content
      utm_medium
      utm_campaing
      utm_term
    end

    private

    def utm_source
      utm[:utm_source] = utm_data['source'] if utm_data['source']
    end

    def utm_content
      utm[:utm_content] = utm_data['content'] if utm_data['content']
    end

    def utm_medium
      utm[:utm_medium] = utm_data['medium'] if utm_data['medium']
    end

    def utm_campaing
      utm[:utm_campaing] = utm_data['source'] if utm_data['campaing']
    end

    def utm_term
      utm[:utm_term] = utm_data['term'] if utm_data['term']
    end
  end
end