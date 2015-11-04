class CreatePeopleOpenings < ActiveRecord::Migration
  def change
    create_table :people_openings, :id => false do |t|
      t.references :person
      t.references :opening
    end
  end
end
