class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :text_message
      t.boolean :result

      t.timestamps
    end
  end
end
