class LittleThingsController < ApplicationController
  def edit
  	@thing_params = thing_params
  	@thing = Thing.find(@thing_params[:id])
  	@thing.little_things_attributes = @thing_params[ :little_things_attributes]
  	respond_to do |format|
      if @thing.save
        format.html { redirect_to @thing, notice: 'Thing was successfully created.' }
        format.json { render :show, status: :created, location: @thing }
      else
        format.html { render "things/show", notice: 'error' }
        format.json { render json: @thing.errors, status: :unprocessable_entity }
      end
    end
  	
  end

  def thing_params
      @thing_params = params.require(:thing).permit(:id, :name,:deadline,
       category_attributes: :name, little_things_attributes: :body)
  end
end
