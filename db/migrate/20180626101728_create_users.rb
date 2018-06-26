class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.boolean :archived

      t.timestamps
    end
  end
end
