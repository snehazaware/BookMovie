class RemoveScreensFromTheatre < ActiveRecord::Migration[6.1]
  def change
    remove_column :theatres, :screens, :string
  end
end
