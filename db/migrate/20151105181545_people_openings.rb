class PeopleOpenings < ActiveRecord::Migration
  def change
    rename_table :people_openings, :openings_people
  end
end
