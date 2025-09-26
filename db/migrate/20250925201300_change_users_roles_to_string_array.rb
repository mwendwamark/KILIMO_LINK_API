class ChangeUsersRolesToStringArray < ActiveRecord::Migration[8.0]
  def up
    change_column :users, :roles, :string, array: true, default: [], using: "CASE WHEN roles IS NULL OR roles = '' THEN '{}'::text[] ELSE ARRAY[roles] END"
  end

  def down
    change_column :users, :roles, :string, using: "CASE WHEN roles IS NULL OR array_length(roles, 1) = 0 THEN NULL ELSE roles[1] END"
  end
end
