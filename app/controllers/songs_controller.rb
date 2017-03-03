class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  skip_before_action :set_song, only: [:index]
  # load_and_authorize_resource

  # GET /songs
  # GET /songs.json
  def index
    if params[:sort].present?
      @songs = Song.all.order("name ASC")
    elsif params[:search].present?
      @genre = params[:search]
      @genre = Genre.find_by("name like ?", "%#{@genre}%")
      @songs = Song.where(genre_id: @genre.id)
    else
      @songs = Song.all
    end
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(song_params)

    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url, notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_song
    @added = UserSong.create(position: 0, user_id: current_user.id, song_id: params[:id])
    redirect_to root_path, notice: 'Song was successfully added.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:name, :duration, :genre_id)
    end
end
