class CreateProcessors < ActiveRecord::Migration[7.0]
  def change
    create_table :processors do |t|

      t.timestamps
    end
  end
end
