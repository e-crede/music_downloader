class CreateDeleteMes < ActiveRecord::Migration[7.0]
  def change
    create_table :delete_mes do |t|
      t.string :somestring

      t.timestamps
    end
  end
end
