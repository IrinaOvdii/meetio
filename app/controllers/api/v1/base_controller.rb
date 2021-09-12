class Api::V1::BaseController < ApplicationController

  rescue_from Exception, :with => :catch_error_and_render_json

  def render_success(body, code = 200)
    render json: {success: true, body: body}.to_json, status: code
  end

  def render_error(title, body = nil, code = 500)
    render json: {success: false, title: title, body: body}.to_json, status: code
  end

  def catch_error_and_render_json(exception)
    render_error('Oops! Something went wrong...', [exception.message, exception.backtrace[0..30]].flatten, 500) if Rails.env != 'production'
    render_error('Oops! Something went wrong...', '', 500) if Rails.env == 'production'
    true
  end

end
