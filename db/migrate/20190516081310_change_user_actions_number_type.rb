class ChangeUserActionsNumberType < ActiveRecord::Migration[5.2]
  def change
    change_column :company_behaviours, :actions_nb_result, "integer USING actions_nb_result::integer"
  end
end
