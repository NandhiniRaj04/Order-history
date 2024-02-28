class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def download_orders_csv
    user = User.find(params[:id])
    CsvDownloadJob.set(wait: 1.minute).perform_later(user.id)
    redirect_to users_path
  end
end
