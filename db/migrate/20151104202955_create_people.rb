class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :status
      t.string :name
      t.string :encoded_name
      t.string :picture_url

      t.timestamps null: false
    end
  end
end
