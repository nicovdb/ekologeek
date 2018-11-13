class CreateFormCompanyKnowHows < ActiveRecord::Migration[5.2]
  def change
    create_table :form_company_know_hows do |t|
      t.references :form, foreign_key: true
      t.references :company_know_how, foreign_key: true

      t.timestamps
    end
  end
end
