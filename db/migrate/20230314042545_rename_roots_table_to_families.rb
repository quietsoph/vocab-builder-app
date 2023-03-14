class RenameRootsTableToFamilies < ActiveRecord::Migration[5.2]
  def change
    rename_table :roots, :families
  end
end
