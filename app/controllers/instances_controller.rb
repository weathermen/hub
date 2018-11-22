class InstancesController < ApplicationController
  def index
    @instances = Instance.all
  end

  def create
    @instance = Instance.find_or_create_by!(host: instance_params[:host])

    if @instance.update(instance_params)
      flash[:notice] = "Saved instance '#{@instance.host}'"
      head status: :created
    else
      flash[:alert] = "Instance could not be saved."
      head status: :unprocessable_entity
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
