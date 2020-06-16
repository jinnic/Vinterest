class AddPublicToBoard < ActiveRecord::Migration[6.0]
  def change
    add_column :boards, :public, :boolean
  end
end
