class Collect < ApplicationRecord
  belongs_to :bin
  has_one :company, through: :bin
  validates :start_at, :end_at, :end_at, :filled_rate, presence: true
  validate :check_correct_end_at
  validate :check_correct_end_at_versus_today

  def add_weight_person_day
    persons = self.bin.company.trash_diagnostic.employees_nb
    days = self.end_at - self.start_at
    weight = self.filled_rate / 100 * self.bin.volume * self.bin.bin_type.density
    return weight_person_day = weight / persons / days
  end

  def check_correct_end_at
    if self.end_at.present? && self.start_at >= self.end_at
      errors.add(:end_at, "doit être supérieur à la date de début")
    end
  end

  def check_correct_end_at_versus_today
    if self.end_at > Date.today
      errors.add(:end_at, "de relevé ne peut pas être supérieure à aujourd'hui")
    end
  end
end
