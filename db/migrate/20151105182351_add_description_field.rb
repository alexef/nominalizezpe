class AddDescriptionField < ActiveRecord::Migration
  def change
    add_column :people, :description, :text
    add_column :people, :fb_url, :string
    add_column :people, :linkedin_url, :string
  end
end
