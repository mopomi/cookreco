class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string      :title,     null: false
      t.integer     :genre_id,  null: false
      t.text        :point
      t.references  :user,      foreign_key:true
      t.timestamps
    end
  end
end
