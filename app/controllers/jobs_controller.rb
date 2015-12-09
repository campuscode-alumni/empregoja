class JobsController < ApplicationController
  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
    @companies = Company.all
  end

  def create
    @job = Job.create(job_params)
    redirect_to @job
  end

  private

  def job_params
    params.require(:job)
      .permit(:title, :location, :category, :description, :featured,
             :company_id)
  end
end
