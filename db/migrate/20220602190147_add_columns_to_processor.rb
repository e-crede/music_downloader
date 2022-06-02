class AddColumnsToProcessor < ActiveRecord::Migration[7.0]
  def change
    add_column :processors, :url, :string
    add_column :processors, :status, :string
  end
end
