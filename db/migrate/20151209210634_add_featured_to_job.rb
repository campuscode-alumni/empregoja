class AddFeaturedToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :featured, :boolean
  end
end
