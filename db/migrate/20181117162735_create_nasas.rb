class CreateNasas < ActiveRecord::Migration[5.2]
  def change
    create_table :nasas do |t|
      t.string :api
      t.string :url

      t.timestamps
    end
  end
end
