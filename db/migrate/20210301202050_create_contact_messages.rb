class CreateContactMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :contact_messages do |t|
      t.string :name
      t.string :email
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
