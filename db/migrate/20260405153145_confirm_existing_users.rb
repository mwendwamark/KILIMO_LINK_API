class ConfirmExistingUsers < ActiveRecord::Migration[8.0]
  def up
    User.where(confirmed_at: nil).update_all(confirmed_at: Time.current)
  end

  def down
  end
end
