class CreateTrashResultActions < ActiveRecord::Migration[5.2]
  def change
    create_table :trash_result_actions do |t|
      t.references :trash, foreign_key: true
      t.references :result_action, foreign_key: true

      t.timestamps
    end
  end
end
