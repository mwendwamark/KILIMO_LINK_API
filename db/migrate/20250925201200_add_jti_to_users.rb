class AddJtiToUsers < ActiveRecord::Migration[8.0]
  def up
    add_column :users, :jti, :string
    add_index :users, :jti, unique: true

    # backfill existing rows
    execute <<~SQL
      UPDATE users SET jti = gen_random_uuid()::text WHERE jti IS NULL;
    SQL

    change_column_null :users, :jti, false
  end

  def down
    remove_index :users, :jti
    remove_column :users, :jti
  end
end
