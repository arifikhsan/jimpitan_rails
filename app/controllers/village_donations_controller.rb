class VillageDonationsController < ApplicationController
  before_action :set_village_donation, only: %i[ show edit update destroy ]

  # GET /village_donations or /village_donations.json
  def index
    @village_donations = current_user.manage_village.village_donations.all
  end

  # GET /village_donations/1 or /village_donations/1.json
  def show
  end

  # GET /village_donations/new
  def new
    @village_donation = VillageDonation.new
  end

  # GET /village_donations/1/edit
  def edit
  end

  # POST /village_donations or /village_donations.json
  def create
    @village_donation = VillageDonation.new(village_donation_params)

    respond_to do |format|
      if @village_donation.save
        format.html { redirect_to @village_donation, notice: "Village donation was successfully created." }
        format.json { render :show, status: :created, location: @village_donation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @village_donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /village_donations/1 or /village_donations/1.json
  def update
    respond_to do |format|
      if @village_donation.update(village_donation_params)
        format.html { redirect_to @village_donation, notice: "Village donation was successfully updated." }
        format.json { render :show, status: :ok, location: @village_donation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @village_donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /village_donations/1 or /village_donations/1.json
  def destroy
    @village_donation.destroy
    respond_to do |format|
      format.html { redirect_to village_donations_url, notice: "Village donation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_village_donation
      @village_donation = VillageDonation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def village_donation_params
      params.fetch(:village_donation, {})
    end
end
