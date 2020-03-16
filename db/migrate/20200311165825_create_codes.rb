class CreateCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :codes do |t|
      t.integer :user_id
      t.text :body
      t.string :title
      t.string :code_image_id

      t.timestamps
    end
  end
end

