class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :user, :null => false
      t.string :email, :null => false
      t.string :homepage
      t.text :body, :null => false

      t.timestamps
    end
  end
end
