class Job < ActiveRecord::Base
  belongs_to :company

  validates :title, :category, :description, :location, presence: true
end
