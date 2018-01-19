class AddUserToComment < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :comment, foreign_key: true
  end
end
