class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :location
      t.string :mail
      t.string :phone

      t.timestamps null: false
    end
  end
end
