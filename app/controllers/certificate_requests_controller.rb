class CertificateRequestsController < ApplicationController
  before_action :set_certificate_request, only: [:show, :edit, :update, :destroy]

  # GET /certificate_requests
  # GET /certificate_requests.json
  def index
    @certificate_requests = CertificateRequest.all
  end

  # GET /certificate_requests/1
  # GET /certificate_requests/1.json
  def show
  end

  # GET /certificate_requests/new
  def new
    @certificate_request = CertificateRequest.new
  end

  # GET /certificate_requests/1/edit
  def edit
  end

  # POST /certificate_requests
  # POST /certificate_requests.json
  def create
    @certificate_request = CertificateRequest.new(certificate_request_params)

    respond_to do |format|
      if @certificate_request.save
        format.html { redirect_to @certificate_request, notice: 'Certificate request was successfully created.' }
        format.json { render action: 'show', status: :created, location: @certificate_request }
      else
        format.html { render action: 'new' }
        format.json { render json: @certificate_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /certificate_requests/1
  # PATCH/PUT /certificate_requests/1.json
  def update
    respond_to do |format|
      if @certificate_request.update(certificate_request_params)
        format.html { redirect_to @certificate_request, notice: 'Certificate request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @certificate_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /certificate_requests/1
  # DELETE /certificate_requests/1.json
  def destroy
    @certificate_request.destroy
    respond_to do |format|
      format.html { redirect_to certificate_requests_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_certificate_request
      @certificate_request = CertificateRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def certificate_request_params
      params.require(:certificate_request).permit(:encoded_request, :private_key_id)
    end
end
