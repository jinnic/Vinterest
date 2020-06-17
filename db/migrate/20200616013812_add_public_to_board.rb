class AddPublicToBoard < ActiveRecord::Migration[6.0]
  def change
    add_column :boards, :public, :boolean, default: false
  end
end
