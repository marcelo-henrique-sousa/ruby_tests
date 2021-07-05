class AddNameDescriptionPowerBasePowerStepLevelToWepon < ActiveRecord::Migration[5.2]
  def change
    add_column :wepons, :name, :string
    add_column :wepons, :description, :string
    add_column :wepons, :power_base, :integer
    add_column :wepons, :power_step, :integer
    add_column :wepons, :level, :integer
  end
end
