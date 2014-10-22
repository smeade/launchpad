class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :check_browser

  force_ssl if: :ssl_configured? #, host:'www.sitewithvalidsslcert.com'

  def ssl_configured?
    !Rails.env.development?
  end


  private

  # Private: Check that requesting browser is supported.
  #
  # Examples
  #
  #   before_filter :check_browser
  #
  # Stops request and renders text if not supported

  # Versions up to and less than this are unsupported.
  Browser = Struct.new(:browser, :version)
  UnSupportedBrowsers = [
    Browser.new('Safari', '6.0.2'),
    Browser.new('Firefox', '19.0.2'),
    Browser.new('Internet Explorer', '6.0'),
    Browser.new('Chrome', '30')
  ]

  def check_browser
    user_agent = UserAgent.parse(request.user_agent)
    if UnSupportedBrowsers.detect { |browser| user_agent <= browser }
      # redirect_to browser_warning_path
      render text: 'Your browser is not supported!'
    end
  end

end
