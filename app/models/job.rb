class Job < ActiveRecord::Base
  belongs_to :company
  belongs_to :category

  validates :title, :category, :description, :location, presence: true
end
