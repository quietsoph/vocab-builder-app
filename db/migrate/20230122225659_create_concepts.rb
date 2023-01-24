class CreateConcepts < ActiveRecord::Migration[5.2]
  def change
    create_table :concepts do |t|
      t.text :text
      t.text :meaning
      t.text :image
      t.text :example
      t.text :source
      t.text :translation
      t.text :note
      t.integer :category_id

      t.timestamps
    end
  end
end
