class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:notice] = "You added a cute kitten. Hooray"
      redirect_to @kitten
    else
      flash.now[:alert] = "Oops! Something went wrong. Kitten aintn't valid"
      render :new
    end
  end

  def edit
    @kitten = kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(kitten_params)
    if @kitten.update
      flash[:notice] = "You have Updated a cute lil Kitten, nice work"
      redirect_to @kitten
    else
      flash.now[:alert] = "Update failed! Check your form, Kitten master"
      render :edit
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    flash[:notice] = "Kitten deleted ... Why 😿"
    redirect_to kittens_path
  end

  private

  def kittens_path
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
