class CreateTrades < ActiveRecord::Migration[5.1]
  def change
    create_table :trades do |t|
      t.string :title
      t.text :content
      t.string :kakaoid
      t.belongs_to :user, foreign_key: true
      t.string :variety
      t.string :image

      t.timestamps
    end
  end
end
