class ClientsController < ApplicationController
#  load_and_authorize_resource
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.order("nombre ASC").paginate(:per_page => 5, :page => params[:page])
    if params[:search] 
      criterios = params[:search].split(" ")
      puts "cantidad criterios: " + criterios.size.to_s
     
      if @clients.size.zero? 
        flash[:notice] = "No se encontro ningun resultado" 
        @clients = Client.all.order("nombre ASC").paginate(:per_page => 5, :page => params[:page])    
      end
    end 
  end
  
  

  # GET /clients/1
  # GET /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def findRFC
    respond_to do |format|
      if params[:rfc]
        @client = Client.find_by rfc: params[:rfc]
      end
      if @client.nil?
        @client = Client.new
        format.html { render :new } 
      else
        format.html { render :show } 
      end
      format.json { render json: @client, status: :ok }      
    end
  end

  def download_pdf
    client = Client.find(params[:id])
    send_data generate_pdf(client),
              filename: "#{client.nombre}.pdf",
              type: "application/pdf"
  end
 
  private
 
    def generate_pdf(client)
      Prawn::Document.new do
        text client.name, align: :center
        text "Direccion: #{client.direccion}"
        text "Email: #{client.email}"
      end.render
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:rfc, :nombre, :apellidos, :telefono, :direccion, :facebook, :lynkedin, :email)
    end
end