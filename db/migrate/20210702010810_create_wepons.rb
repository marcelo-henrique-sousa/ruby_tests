class CreateWepons < ActiveRecord::Migration[5.2]
  def change
    create_table :wepons do |t|

      t.timestamps
    end
  end
end
