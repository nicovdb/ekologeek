class CreateCompanyKnowHows < ActiveRecord::Migration[5.2]
  def change
    create_table :company_know_hows do |t|
      t.string :origin

      t.timestamps
    end
  end
end
