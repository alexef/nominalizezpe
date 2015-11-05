class CreatePeopleOpenings < ActiveRecord::Migration
  def change
    create_table :people_openings, :id => false do |t|
      t.belongs_to :person
      t.belongs_to :opening
    end
  end
end
