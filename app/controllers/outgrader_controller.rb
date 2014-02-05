class OutgraderController < ApplicationController
  def links
    respond_to do |format|
      format.json { render json: External.all.pluck(:url), status: :ok }
    end
  end

  def redirect
    respond_to do |format|
      format.json do
        external = External.find_by(url: params[:url])
        internal = external.nil? ? nil : external.internal
        render json: internal.url, status: :ok
      end
    end
  end
end
