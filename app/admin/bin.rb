ActiveAdmin.register Bin do
  form :partial => "form"
  config.filters = true
  actions :index, :show

  permit_params :bin_type_id,
                :shared,
                :volume,
                :cost,
                :collector,
                :trash_ids,
                :frequency_number,
                :frequency_periodicity,
                :company_id,
                trashes_attributes: [:id, :name]

  index do
    selectable_column
    id_column
      column (:bin_type_id) { |bin| bin.bin_type.name}
      column (:id) { |bin| bin.company.name}
      column :shared
      column :volume
      column :cost
      column :collector
      column (:trash_ids) { |bin| bin.trashes.map { |trash| trash.name}}

    actions
  end

  show do
    attributes_table do
      row :company
      row :bin_type
      row :volume
      row :collector
      row :shared
      row :cost
      row :frequency_number
      row :frequency_periodicity
      row (:trash_ids) { |bin| bin.trashes.map { |trash| trash.name}}
    end
  end
  csv do
    column (:bin_type_id) { |bin| bin.bin_type.name}
    column (:id) { |bin| bin.company.name}
    column :shared
    column :volume
    column :cost
    column :collector
    column (:trash_ids) { |bin| bin.trashes.map { |trash| trash.name}}
  end

  filter :cost, as: :select
  filter :collector, as: :select
  filter :company, collection: -> { Company.all }, as: :select

end
