class PlatformsController < ApplicationController
  def index
    @platforms = Platform.all
  end

  def new
    @platform = Platform.new
  end

  def create
    @platform = Platform.new(platform_params)
    if @platform.save
      redirect_to platforms_path, notice: "Platform was successfully created."
    else
      render :new
    end
  end

  private

  def platform_params
    params.require(:platform).permit(
      :name,
      :api_key,
      :api_secret
    )
  end
end
