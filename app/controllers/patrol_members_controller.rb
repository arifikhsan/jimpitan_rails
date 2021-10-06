class PatrolMembersController < ApplicationController
  before_action :set_patrol_member, only: %i[ show edit update destroy ]

  # GET /patrol_members or /patrol_members.json
  def index
    @patrol_members = PatrolMember.where(village_id: current_user.manage_village.id).all
  end

  # GET /patrol_members/1 or /patrol_members/1.json
  def show
  end

  # GET /patrol_members/new
  def new
    @patrol_member = PatrolMember.new
  end

  # GET /patrol_members/1/edit
  def edit
  end

  # POST /patrol_members or /patrol_members.json
  def create
    @patrol_member = PatrolMember.new(patrol_member_params)

    respond_to do |format|
      if @patrol_member.save
        format.html { redirect_to @patrol_member, notice: "Patrol member was successfully created." }
        format.json { render :show, status: :created, location: @patrol_member }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @patrol_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patrol_members/1 or /patrol_members/1.json
  def update
    respond_to do |format|
      if @patrol_member.update(patrol_member_params)
        format.html { redirect_to @patrol_member, notice: "Patrol member was successfully updated." }
        format.json { render :show, status: :ok, location: @patrol_member }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @patrol_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patrol_members/1 or /patrol_members/1.json
  def destroy
    @patrol_member.destroy
    respond_to do |format|
      format.html { redirect_to patrol_members_url, notice: "Patrol member was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patrol_member
      @patrol_member = PatrolMember.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def patrol_member_params
      params.require(:patrol_member).permit(:village_id, :user_id, :day_in_week)
    end
end
