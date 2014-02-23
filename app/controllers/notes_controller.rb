class NotesController < ApplicationController
  before_filter :user_is_permitted

  def index
    @user = find_user
    @notes = @user.notes.all
  end

  def show
    @user = find_user
    @note = find_note(@user)
  end

  def new
    @user = find_user
    @note = @user.notes.new
  end

  def create
    @user = find_user
    @note = @user.notes.new params[:note]
    @note.save
    redirect_to root_path(anchor: 'notes')
  end

  def edit
    @user = find_user
    @note = find_note(@user)
  end

  def update
    @user = find_user
    @note = find_note(@user)
    @note.update_attributes params[:note]
    redirect_to user_note_path(@user, @note)
  end

  def destroy
    @user = find_user
    @note = find_note(@user)
    @note.destroy
    redirect_to root_path(anchor: 'notes')
  end

  private

  def find_user
    @user = User.find params[:user_id]
  end

  def find_note(user)
    @note = user.notes.find params[:id]
  end
end
