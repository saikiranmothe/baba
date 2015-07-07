class UploadsController < ApplicationController
  before_filter :set_upload, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @uploads = Upload.all
    respond_with(@uploads)
  end

  def show
    respond_with(@upload)
  end

  def new
    @upload = Upload.new
    respond_with(@upload)
  end

  def edit
  end

  def create
    @upload = Upload.new(params[:upload])
    @upload.save
    respond_with(@upload)
  end

  def update
    @upload.update_attributes(params[:upload])
    respond_with(@upload)
  end

  def destroy
    @upload.destroy
    respond_with(@upload)
  end

  private
    def set_upload
      @upload = Upload.find(params[:id])
    end
end
