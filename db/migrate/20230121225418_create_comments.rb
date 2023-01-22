class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :post
      t.integer :author
      t.string :content

      t.timestamps
    end
    add_foreign_key :comments, :posts, column: :post
    add_foreign_key :comments, :users, column: :author
  end
end
