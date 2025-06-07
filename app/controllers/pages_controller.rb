class PagesController < ApplicationController
  def home
    client = Pexels::Client.new(ENV.fetch("PEXELS_API_KEY"))

    if params[:query].present?
      @query = params[:query]
      @photos = client.photos.search(@query).photos
    end
  end
end
