class CreateMessages < ActiveRecord::Migration[7.2]
  def change
    create_table :messages do |t|
      t.string :user
      t.references :room, null: false, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
