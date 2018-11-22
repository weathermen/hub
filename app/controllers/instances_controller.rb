class InstancesController < ApplicationController
  def index
    @instances = Instance.all
  end

  def create
    @instance = Instance.find_or_create_by!(host: instance_params[:host])
    @instance.update!(version: instance_params[:version])

    render json: @instance, status: :created
  end

  private

  def instance_params
    params.require(:instance).permit(:host, :version)
  end
end
