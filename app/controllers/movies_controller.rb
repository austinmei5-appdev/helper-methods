class MoviesController < ApplicationController
  def new
    @movie = Movie.new

    # render template: "movies/new"

    # we can omit the line above since movies matches MoviesController and new matches the definition
  end

  def index
    @movies = Movie.order(created_at: :desc)

    respond_to do |format|
      format.json do
        render json: @list_of_movies
      end

      format.html # do
      #   render template: "movies/index"
      # end
    end
  end

  def show
    # @movie = Movie.where(id: params.fetch(:id)).first

    # @movie = Movie.find_by(id: params.fetch(:id))

    @movie = Movie.find(params.fetch(:id))
  end

  def create
    @movie = Movie.new
    @movie.title = params.fetch(:movie).fetch(:title)
    @movie.description = params.fetch(:movie).fetch(:description)

    if @movie.valid?
      @movie.save
      redirect_to movies_url, notice: "Movie created successfully."
    else
      render template: "movies/new" # cannot delete this one
    end
  end

  def edit
    @movie = Movie.find(params.fetch(:id))

    # render template: "movies/edit"
  end

  def update
    @movie = Movie.find(params.fetch(:id))

    @movie.title = params.fetch(:movie).fetch(:title)
    @movie.description = params.fetch(:movie).fetch(:description)

    if @movie.valid?
      @movie.save
      redirect_to movie_url(@movie.id), notice: "Movie updated successfully."
    else
      redirect_to movie_url(@movie.id), alert: "Movie failed to update successfully."
    end
  end

  def destroy
    @movie = Movie.find(params.fetch(:id))

    @movie.destroy

    redirect_to movies_url, notice: "Movie deleted successfully."
  end
end
