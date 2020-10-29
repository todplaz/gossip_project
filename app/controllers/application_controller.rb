class ApplicationController < ActionController::Base
    add_flash_types :alert, :danger, :info, :error, :warning
    include SessionsHelper
end
