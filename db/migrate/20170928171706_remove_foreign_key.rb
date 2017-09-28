class RemoveForeignKey < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key "comments", "products", on_delete: :nullify
  end
end
