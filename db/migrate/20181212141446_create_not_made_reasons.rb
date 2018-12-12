class CreateNotMadeReasons < ActiveRecord::Migration[5.2]
  def change
    create_table :not_made_reasons do |t|
      t.string :reason

      t.timestamps
    end
  end
end
