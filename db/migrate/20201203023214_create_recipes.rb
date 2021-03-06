class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string      :title,     null: false
      t.integer     :genre_id,  null: false
      t.string      :url
      t.text        :point
      t.references  :user,      foreign_key:true
      t.integer     :likes_count
      t.timestamps
    end
  end
end
