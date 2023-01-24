class CreateLinkages < ActiveRecord::Migration[5.2]
  def change
    create_table :linkages do |t|
      t.references :concept, foreign_key: true
      t.references :linking_concept, references: :concepts, foreign_key: { to_table: :concepts }
      t.integer :association_id

      t.timestamps
    end
  end
end
