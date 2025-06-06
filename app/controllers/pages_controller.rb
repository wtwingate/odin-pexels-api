class PagesController < ApplicationController
  def home
    client = Pexels::Client.new

    if params[:query].present?
      @query = params[:query]
      @results = client.photos.search(@query)
      @photo_urls = @results.photos.map do |photo|
        photo.src["medium"]
      end
    end
  end
end
