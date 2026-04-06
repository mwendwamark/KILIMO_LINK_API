class ConfirmExistingUsers < ActiveRecord::Migration[8.0]
  def change
    User.where(confirmed_at: nil).update_all(confirmed_at: Time.current)
  end
end
