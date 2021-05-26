class LandmarksController < ApplicationController
  # add controller methods

  get '/landmarks/new' do
    @landmark = Landmark.find_by(id: params[:id])

    erb :'landmarks/new'
  end

  post '/landmarks' do
    
    landmark = Landmark.create(params)

    redirect to "landmarks/#{landmark.id}"

  end

end
