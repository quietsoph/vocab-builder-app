class UpdateJoinTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :concepts_roots, :concepts_families

    rename_column :concepts_families, :root_id, :family_id

  end
end
