class AddDefaultLevelToWepon < ActiveRecord::Migration[5.2]
  def change
    change_column_default :wepons, :level, 1
  end
end
