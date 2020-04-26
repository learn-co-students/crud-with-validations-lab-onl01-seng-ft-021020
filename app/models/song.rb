class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  # validates :released, inclusion: {in: %w(true false)}
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :released
  validate :release_year_cannot_be_in_the_future

  def release_year_cannot_be_in_the_future
    if release_year.present? && release_year > Date.today.year
      errors.add(:release_year, "Can't be in the future")
    end
  end

end
