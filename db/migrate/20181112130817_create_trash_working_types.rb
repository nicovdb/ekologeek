class CreateTrashWorkingTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :trash_working_types do |t|
      t.string :type

      t.timestamps
    end
  end
end
