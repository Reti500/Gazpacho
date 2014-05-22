class FormsController < ApplicationController
  before_action :require_login
  before_action :set_form, only: [:show, :edit, :update, :destroy, :change_state]

  # GET /forms
  # GET /forms.json
  def index
    @forms = Form.all

    respond_to do |format|
      format.html {}
      format.json { render json: @forms }
    end
  end

  # GET /forms/1
  # GET /forms/1.json
  def show
    @questions = @form.questions

    respond_to do |format|
      format.html {}
      format.json {render json: @form}
    end
  end

  # GET /forms/new
  def new
    @form = Form.new
  end

  # GET /forms/1/edit
  def edit
  end

  # POST /forms
  # POST /forms.json
  def create
    @form = Form.new(form_params)

    current_user.forms << @form
    
    respond_to do |format|
      if @form.save
        format.html { redirect_to forms_path, notice: 'Form was successfully created.' }
        format.json { render json: { status: 'successfully' } }
      else
        format.html { render action: 'new' }
        format.json { render json: @form.errors }
      end
    end
  end

  # PATCH/PUT /forms/1
  # PATCH/PUT /forms/1.json
  def update
    respond_to do |format|
      if @form.update(form_params)
        format.html { redirect_to @form, notice: 'Form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  def change_state
    @form.state = params[:state]
    render json: { state: (@form.save && 'OK') || 'ERROR' }
  end

  # DELETE /forms/1
  # DELETE /forms/1.json
  def destroy
    @form.destroy
    respond_to do |format|
      format.html { redirect_to forms_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form
      @form = Form.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_params
      params.require(:form).permit(:name, :project_id)
    end
end
