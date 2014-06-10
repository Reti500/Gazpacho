class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
  
  def new
  end

  def create
  	user = login(params[:email], params[:password], params[:remember_me])

    respond_to do |format|
      if user
        format.html { redirect_back_or_to forms_url, :notice => "Logged in!" }
        format.json { render json: {state:"Logged"} }
      else
        flash.now.alert = "Email or password was invalid"
        format.html { render :new }
        format.json { render json: {state:"Error"} }
      end
    end
  end

  def destroy
  	logout
  	redirect_to root_url, :notice => "Logged out!"
  end

  def verify_session
    @state = (current_user && 'activo') || 'no activo'
    render json: { state: @state }
  end
end
