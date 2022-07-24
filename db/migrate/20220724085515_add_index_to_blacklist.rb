class AddIndexToBlacklist < ActiveRecord::Migration[6.1]
  def change
    add_index :blacklists, :ip, unique: true
  end
end
