ActiveAdmin.register Collect do
  config.filters = true
  actions :index

  permit_params :start_at, :end_at, :filled_rate, :comment, :status, :bin_id

  index do
    selectable_column
    id_column
    column (:bin_id) { |collect| collect.bin.company.name}
    column (:bin_id) { |collect| collect.bin.bin_type.name}
    column (:bin_id) { |collect| collect.bin.volume}
    column (:bin_id) { |collect| collect.bin.bin_type.density}
    column (:bin_id) { |collect| collect.bin.company.trash_diagnostic.employees_nb}
    column :start_at
    column :end_at
    column :filled_rate
    column :comment
    column :status
    actions
  end

  filter :start_at, as: :date_range
  filter :end_at, as: :date_range
  filter :company, as: :select

  csv do
    column (:bin_id) { |collect| collect.bin.company.name}
    column (:bin_id) { |collect| collect.bin.bin_type.name}
    column :start_at
    column :end_at
    column :filled_rate
    column :comment
    column :status
  end

end
