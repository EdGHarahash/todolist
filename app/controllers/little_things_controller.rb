class LittleThingsController < ApplicationController
  def create
  	@thing_params = thing_params
  	@thing = Thing.find(@thing_params[:id])
  	@thing.little_things_attributes = @thing_params[ :little_things_attributes]
  	respond_to do |format|
      if @thing.save
        format.html { redirect_to @thing, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @thing }
      else
        format.html { redirect_to @thing, notice: 'New tasks are not valid' }
        format.json { render json: @thing.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @lt = LittleThing.find(little_thing_params[:id])
    @lt.update(little_thing_params)
  end

  def thing_params
      params.require(:thing).permit(:id, :name,:deadline,
       category_attributes: :name, little_things_attributes: :body)
  end

  def little_thing_params
    params.require(:little_thing).permit(:id, :done)
  end
end
