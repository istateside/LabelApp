class NotesController < ApplicationController
  def new
    @user = current_user
    @track = Track.find(params[:track_id])
    @note = @track.notes.new
    render :new
  end

  def create
    @track = Track.find(params[:track_id])
    @note = current_user.notes.new(note_params)
    if @note.save
      flash[:notice] = "Comment added."
      redirect_to track_url(@track)
    else
      flash[:errors] = @track.errors.full_messages
      redirect_to track_url(@track)
    end
  end

  def destroy
    @note = Note.find(params[:id])
    if @note.user == current_user
      @track = @note.track
      @note.destroy
      redirect_to track_url(@track)
    else
      render text: "NOT SO FAST, DIRTBAG.", :status => :forbidden
    end
  end

  private
  def note_params
    note_params = {}
    note_params = params.require(:note).permit(:comment, :track_id)
  end
end
