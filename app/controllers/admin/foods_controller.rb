require 'aws-sdk-s3'


class Admin::FoodsController < ApplicationController
  before_action :set_food, only: %i[ show edit update destroy ]

  # GET /foods or /foods.json
  def index
    @foods = Food.all
  end

  # GET /foods/1 or /foods/1.json
  def show
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit
  end

  def upload_image
    bucket_name = 'nutrient-facts'
    object_key = 'my-file.txt'
    region = 'us-east-1'


    aws = Rails.application.credentials.aws

    creds = Aws::Credentials.new(aws[:access_key_id], aws[:secret_access_key])
    s3_client = Aws::S3::Client.new(region: region, credentials: creds)

    s3 = Aws::S3::Resource.new(
        credentials: creds,
        region: 'us-east-1'
    )

    obj = s3.bucket('nutrient-facts').object(Time.now.to_f.to_s + "-" + params['filename'].original_filename)
    obj.upload_file(params['filename'].tempfile.path, acl:'public-read')
    render json: { url: obj.public_url }

  end

  # POST /foods or /foods.json
  def create
    results = food_params.to_h
    results["tags"] = Tag.where(id: [results["tags"].split(",")])
    results["facts"] = Fact.where(id: [results["facts"].split(",")])

    @food = Food.new(results)

    respond_to do |format|
      if @food.save
        format.html { redirect_to @food, notice: "Food was successfully created." }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1 or /foods/1.json
  def update
    results = food_params.to_h
    results["tags"] = Tag.where(id: [results["tags"].split(",")])
    results["facts"] = Fact.where(id: [results["facts"].split(",")])

    respond_to do |format|
      if @food.update(results)
        format.html { redirect_to [:admin, :foods], notice: "Food was successfully updated." }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food.destroy
    respond_to do |format|
      format.html { redirect_to foods_url, notice: "Food was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def food_params
      params.require(:food).permit(:published, :description, :name, :image_url, :slug, :tags, :facts)
    end
end
