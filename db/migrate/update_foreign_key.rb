class UpdateForeignkeyInfoInPacts < ActiveRecord::Migration
  def change
    add_foreign_key "comments", "products", on_delete: :nullify
  end
end