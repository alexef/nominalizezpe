class AddVotPozitive < ActiveRecord::Migration
  def change
    add_column :votes, :pozitive, :boolean, :default => true
  end
end
