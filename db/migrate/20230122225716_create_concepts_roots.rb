class CreateConceptsRoots < ActiveRecord::Migration[5.2]
  def change
    create_table :concepts_roots, :id => false do |t|
      t.integer :concept_id
      t.integer :root_id

      t.timestamps
    end
  end
end
