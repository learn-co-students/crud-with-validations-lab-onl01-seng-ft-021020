class Song < ApplicationRecord
  validates :title, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released
  validates :artist_name, presence: true
  validate :repeat_title, :valid_year

  def repeat_title
    unless Song.where(title: self.title, artist_name: self.artist_name, release_year: self.release_year).empty?
      errors.add(:title, "Can't have the same title and artist in the same year")
    end
  end

  def valid_year
    return if self.release_year.nil?
    if self.release_year > Date.today.year
      errors.add(:release_year, "Year cannot be greater than current year")
    end
  end
end
