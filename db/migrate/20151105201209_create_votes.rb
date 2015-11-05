class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.text :comment
      t.references :person
      t.references :opening
      t.references :user

      t.timestamps null: false
    end
  end
end
