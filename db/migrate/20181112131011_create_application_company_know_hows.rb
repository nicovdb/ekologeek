class CreateApplicationCompanyKnowHows < ActiveRecord::Migration[5.2]
  def change
    create_table :application_company_know_hows do |t|
      t.references :application, foreign_key: true
      t.references :company_know_how, foreign_key: true

      t.timestamps
    end
  end
end
