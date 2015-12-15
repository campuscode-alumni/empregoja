class Company < ActiveRecord::Base
  has_many :jobs
  validates :name, :location, :mail, :phone, presence: true
end
