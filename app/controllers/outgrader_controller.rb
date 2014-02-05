class OutgraderController < ApplicationController
  def links
    render json: External.select(:id, :url), status: :ok
  end

  def redirect
    external = External.find_by(url: params[:url])
    url = external.nil? ? nil : external.internal.url
    render json: url, status: :ok
  end

  def css
    render json: Site.select(:id, :name, :css )
  end
  def all
    array = []
    Site.all.each do |site|
      array << {site: site.name, code: site.banner.code, css: site.css, links: site.externals.pluck(:url)}
    end
    render json: array
  end
end
