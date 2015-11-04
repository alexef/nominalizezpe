class CreateOpenings < ActiveRecord::Migration
  def change
    create_table :openings do |t|
      t.string :name

      t.timestamps null: false
    end

    add_reference :people, :opening, index:true, foreign_key: true
  end
end
