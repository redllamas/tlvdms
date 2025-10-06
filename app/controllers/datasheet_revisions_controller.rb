class DatasheetRevisionsController < ApplicationController
  before_action :set_datasheet_revision, only: %i[ show edit update destroy ]

  # GET /datasheet_revisions or /datasheet_revisions.json
  def index
    @datasheet_revisions = DatasheetRevision.all
  end

  # GET /datasheet_revisions/1 or /datasheet_revisions/1.json
  def show
  end

  # GET /datasheet_revisions/new
  def new
    @datasheet_revision = DatasheetRevision.new
  end

  # GET /datasheet_revisions/1/edit
  def edit
  end

  # POST /datasheet_revisions or /datasheet_revisions.json
  def create
    @datasheet_revision = DatasheetRevision.new(datasheet_revision_params)

    respond_to do |format|
      if @datasheet_revision.save
        format.html { redirect_to @datasheet_revision, notice: "Datasheet revision was successfully created." }
        format.json { render :show, status: :created, location: @datasheet_revision }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @datasheet_revision.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /datasheet_revisions/1 or /datasheet_revisions/1.json
  def update
    respond_to do |format|
      if @datasheet_revision.update(datasheet_revision_params)
        format.html { redirect_to @datasheet_revision, notice: "Datasheet revision was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @datasheet_revision }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @datasheet_revision.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /datasheet_revisions/1 or /datasheet_revisions/1.json
  def destroy
    @datasheet_revision.destroy!

    respond_to do |format|
      format.html { redirect_to datasheet_revisions_path, notice: "Datasheet revision was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  # app/controllers/datasheet_revisions_controller.rb
  def clone
    original = DatasheetRevision.find(params[:id])
    new_rev  = original.duplicate(new_version: params[:new_version]) # or nil -> auto
    redirect_to edit_datasheet_revision_path(new_rev),
                notice: "Cloned to version #{new_rev.version}"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_datasheet_revision
      @datasheet_revision = DatasheetRevision.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def datasheet_revision_params
      params.expect(datasheet_revision: [ :datasheet_id, :region, :locale, :version, :body, :source_template, :render_params, :status, :published_at ])
    end
end
