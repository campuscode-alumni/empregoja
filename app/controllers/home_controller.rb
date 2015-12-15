class HomeController < ApplicationController
  def index
    @jobs = Job.all
    @companies = Company.all
    @categories = Category.all
  end
end
