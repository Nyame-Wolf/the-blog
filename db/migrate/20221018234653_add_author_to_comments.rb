class AddAuthorToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :author, null: false, foreign_key: true
  end
end
