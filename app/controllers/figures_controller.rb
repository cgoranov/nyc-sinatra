

class FiguresController < ApplicationController
  # add controller methods

  get '/figures/new' do
    
    erb :'/figures/new'

  end

  get '/figures' do
    
    @figures = Figure.all

    erb :'/figures/index'

  end

  post '/figures' do

    @figure = Figure.create(params['figure']) 

    if !params[:title][:name].empty?
      @title = Title.create(params[:name])
      @figure.titles << @title
    end
    
    if !params[:landmark][:name].empty? 
      @landmark = Landmark.create(params[:landmark])
      @figure.landmarks << @landmark
    end

    redirect to "/figures/#{@figure.id}"

  end

  get '/figures/:id/edit' do

    @figure = Figure.find_by(id: params[:id])

    @titles = Title.all

    @landmarks = Landmark.all

    erb :'/figures/edit'

  end

  patch '/figures/:id' do
    
    figure = Figure.find_by(id: params[:id])
    figure.update(params[:figure])

    if !params[landmark][name].empty?
      figure.landmarks << Landmark.new(params[:landmark][:name])
    end

  end

  get '/figures/:id' do
  
    @figure = Figure.find_by(id: params[:id])

    erb :'/figures/show'

  end

end
