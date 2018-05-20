class CreateReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :replies do |t|
      t.text :content
      t.belongs_to :user, foreign_key: true
      t.belongs_to :trade, foreign_key: true

      t.timestamps
    end
  end
end
