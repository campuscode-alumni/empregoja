class Category < ActiveRecord::Base
  has_many :jobs
  validates :name, presence: true
end
