class KittensController < ApplicationController
  def index
    @kittens=Kitten.all
    respond_to do |format|
      format.html
      format.json { render json: @kittens }
    end
  end
  def show
    @kitten=Kitten.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @kitten }
    end
  end
  def new
    @kitten=Kitten.new()
  end
  def create
    @kitten=Kitten.new(kitten_params)
    if @kitten.save
      flash[:notice]="Kitten created"
      redirect_to @kitten
    else
      flash.now[:error]=@kitten.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @kitten=Kitten.find(params[:id])
  end
  def update
    @kitten=Kitten.find(params[:id])
    if @kitten.update(kitten_params)
      flash[:notice]="Kitten updated"
      redirect_to @kitten
    else
      flash.now[:error]=@kitten.errors.full_messages
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    Kitten.destroy(params[:id])
    flash[:notice]="Kitten deleted"
    redirect_to kittens_path
  end
  private
  def kitten_params
    params.expect(kitten: [ :name, :age, :softness, :cuteness ])
  end
end
