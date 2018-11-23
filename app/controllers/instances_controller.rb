class InstancesController < ApplicationController
  before_action :authenticate_user!, except: %i[index create]

  def index
    @instances = Instance.all
  end

  def create
    @instance = Instance.find_or_create_by!(host: instance_params[:host]) do |instance|
      instance.version = instance_params[:version] # only gets called on create
    end

    if @instance.update(instance_params)
      flash[:notice] = "Saved instance '#{@instance.host}'"
      head :created
    else
      flash[:alert] = "Instance could not be saved."
      head :unprocessable_entity
    end
  end

  def edit
    @instance = Instance.find(params[:id])
  end

  def update
    @instance = Instance.find(params[:id])

    if @instance.update(instance_params)
      flash[:notice] = "Instance '#{@instance.host}' has been updated."
      redirect_to root_url
    else
      flash[:alert] = "Instance '#{@instance.host}' could not been updated."
      render :edit
    end
  end

  def destroy
    @instance = Instance.find(params[:id])

    if @instance.destroy
      flash[:notice] = "Instance '#{@instance.host}' has been deleted."
    else
      flash[:alert] = "Error destroying instance '#{@instance.host}'"
    end

    redirect_to root_url
  end

  private

  def instance_params
    params.require(:instance).permit(:host, :version)
  end

  def set_headers
    headers['X-Success'] = flash[:notice]
    headers['X-Error'] = flash[:alert]
  end
end
