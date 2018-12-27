class Collect < ApplicationRecord
  belongs_to :bin

  def add_weight_person_day
    persons = self.bin.company.trash_diagnostic.employees_nb
    days = self.end_at - self.start_at
    weight = self.filled_rate / 100 * self.bin.volume * self.bin.bin_type.density
    return weight_person_day = weight / persons / days

  end
end
