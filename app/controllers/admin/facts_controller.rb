class Admin::FactsController < Admin::AdminController
  before_action :set_fact, only: %i[ show edit update destroy ]
  

  # GET /facts or /facts.json
  def index
    @facts = Fact.all
  end

  # GET /facts/1 or /facts/1.json
  def show
  end

  # GET /facts/new
  def new
    @fact = Fact.new
  end

  # GET /facts/1/edit
  def edit
  end

  # POST /facts or /facts.json
  def create
    results = fact_params.to_h
    results["tags"] = Tag.where(id: [results["tags"].split(",")])

    @fact = Fact.new(results)

    respond_to do |format|
      if @fact.save
        format.html { redirect_to @fact, notice: "Fact was successfully created." }
        format.json { render :show, status: :created, location: @fact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facts/1 or /facts/1.json
  def update
    results = fact_params.to_h
    results["tags"] = Tag.where(id: [results["tags"].split(",")])

    respond_to do |format|
      if @fact.update(results)
        format.html { redirect_to [:admin, :facts], notice: "Fact was successfully updated." }
        format.json { render :show, status: :ok, location: @fact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facts/1 or /facts/1.json
  def destroy
    @fact.destroy
    respond_to do |format|
      format.html { redirect_to admin_facts_url, notice: "Fact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fact
      @fact = Fact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fact_params
      params.require(:fact).permit(:published, :links, :headline, :summary, :tags)
    end
end
