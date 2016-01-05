class Job < ActiveRecord::Base
  DAYS_TO_BE_RECENT = 5.days
  belongs_to :company
  belongs_to :category

  validates :title, :category, :description, :location, :company, presence: true

  def recent?
    Time.zone.now < (created_at + DAYS_TO_BE_RECENT)
  end
end
