class ThingsController < ApplicationController
  before_action :set_thing, only: [:show, :edit, :update, :destroy]

  # GET /things
  # GET /things.json
  def index
    @things = Thing.all
  end

  # GET /things/1
  # GET /things/1.json
  def show
  end

  # GET /things/new
  def new
    @thing = Thing.new
  end

  # GET /things/1/edit
  def edit
  end

  # POST /things
  # POST /things.json
  def create
    @thing = Thing.new(thing_params)
    @thing.user_id = current_user.id
    respond_to do |format|
      if @thing.save
        format.html { redirect_to @thing, notice: 'Thing was successfully created.' }
        format.json { render :show, status: :created, location: @thing }
      else
        format.html { render :new }
        format.json { render json: @thing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /things/1
  # PATCH/PUT /things/1.json
  def update
    if @thing.user_id = current_user.id
      respond_to do |format|
        if @thing.update(thing_params)
          format.html { redirect_to @thing, notice: 'Thing was successfully updated.' }
          format.json { render :show, status: :ok, location: @thing }
        else
          format.html { render :edit }
          format.json { render json: @thing.errors, status: :unprocessable_entity }
        end
      end
    else
      render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
    end
  end

  # DELETE /things/1
  # DELETE /things/1.json
  def destroy
    if @thing.user_id = current_user.id
      @thing.destroy
      respond_to do |format|
        format.html { redirect_to things_url, notice: 'Thing was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thing
      @thing = Thing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def thing_params
      @thing_params = params.require(:thing).permit(:id, :name,:deadline,
       category: :name, little_things_attributes: :body)
      @thing_params[:category] = Category.find_or_create_by(name: @thing_params[:category][:name])
      @thing_params
    end
end
