class CreateRootsConcepts < ActiveRecord::Migration[5.2]
  def change
    create_table :roots_concepts, :id => false do |t|
      t.integer :root_id
      t.integer :concept_id

      t.timestamps
    end
  end
end
