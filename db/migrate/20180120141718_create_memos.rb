class CreateMemos < ActiveRecord::Migration[5.1]
  def change
    create_table :memos do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
