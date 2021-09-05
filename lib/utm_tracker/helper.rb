module UtmTracker
  module Helper
    protected

    def get_utm_data
      session[:utm_data] ||= params[:utm]
    end
  end
end