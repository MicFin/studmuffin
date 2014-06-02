class RoomsController < ApplicationController
before_filter :config_opentok,:except => [:index]
  def index
    @rooms = Room.where(:public => true).order("created_at DESC")
    @new_room = Room.new
  end

  def create
    #commented onut to trouble shoot, could add in
    # session = @opentok.create_session request.remote_addr
    @new_session = @opentok.create_session 
    params[:room][:sessionId] = @new_session.session_id
    @new_room = Room.new(params[:room])
    @tok_token = @new_session.generate_token :session_id =>@new_session.session_id  
    respond_to do |format|
      if @new_room.save
        format.html { redirect_to("/party/"+@new_room.id.to_s) }
      else
        format.html { render :controller => 'rooms',
          :action => "index" }
      end
    end
  end

  def party
    @room = Room.find(params[:id])
     @tok_token =  @opentok.generate_token Room.find(params[:id]).sessionId  
  end

  private
  def config_opentok
    if @opentok.nil?
     @opentok = OpenTok::OpenTok.new ENV["API_KEY"], ENV["API_SECRET"]
    end
  end
end
