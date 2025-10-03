class DatasheetsController < ApplicationController
  before_action :set_datasheet, only: %i[ show edit update destroy ]

  # GET /datasheets or /datasheets.json
  def index
    @datasheets = Datasheet.all
  end

  # GET /datasheets/1 or /datasheets/1.json
  def show
  end

  # GET /datasheets/new
  def new
    @datasheet = Datasheet.new
  end

  # GET /datasheets/1/edit
  def edit
  end

  # POST /datasheets or /datasheets.json
  def create
    @datasheet = Datasheet.new(datasheet_params)

    respond_to do |format|
      if @datasheet.save
        format.html { redirect_to @datasheet, notice: "Datasheet was successfully created." }
        format.json { render :show, status: :created, location: @datasheet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @datasheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /datasheets/1 or /datasheets/1.json
  def update
    respond_to do |format|
      if @datasheet.update(datasheet_params)
        format.html { redirect_to @datasheet, notice: "Datasheet was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @datasheet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @datasheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /datasheets/1 or /datasheets/1.json
  def destroy
    @datasheet.destroy!

    respond_to do |format|
      format.html { redirect_to datasheets_path, notice: "Datasheet was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_datasheet
      @datasheet = Datasheet.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def datasheet_params
      params.expect(datasheet: [ :doc_no, :title, :status ])
    end
end
