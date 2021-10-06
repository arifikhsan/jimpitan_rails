class VillagesController < ApplicationController
  def create
    @village = Village.new(village_params)
    if @village.save
      @village.managers.create(user_id: current_user.id)
      current_user.role = Role.manager
      current_user.save
      redirect_to root_path, notice: 'Desa berhasil dibuat.'
    else
      redirect_to root_path, alert: 'Gagal membuat desa baru.'
    end
  end

  private

  def village_params
    params.require(:village).permit(:name)
  end
end
