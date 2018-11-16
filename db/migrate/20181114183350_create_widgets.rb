class CreateWidgets < ActiveRecord::Migration[5.2]
  def change
    create_table :widgets do |t|
      t.string :search
      t.text :result

      t.timestamps
    end
  end
end
