class CreateFormTrashWorkingTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :form_trash_working_types do |t|
      t.references :form, foreign_key: true
      t.references :trash_working_type, foreign_key: true

      t.timestamps
    end
  end
end
