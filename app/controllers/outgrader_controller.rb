class OutgraderController < ApplicationController
  def links
    render json: External.all.pluck(:url), status: :ok
  end

  def redirect
    external = External.find_by(url: params[:url])
    url = external.nil? ? nil : external.internal.url
    render json: url, status: :ok
  end
end
