class JobsController < ApplicationController
  before_action :set_companies, only: [:new, :create]

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to @job
    else
      render :new
    end
  end

  private

  def set_companies
    @companies = Company.all
  end

  def job_params
    params.require(:job)
      .permit(:title, :location, :category, :description, :featured,
             :company_id)
  end
end
