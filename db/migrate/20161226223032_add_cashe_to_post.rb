class AddCasheToPost < ActiveRecord::Migration
  def change
    add_column :posts, :cached_votes_score, :integer, :default => 0
  end
end
