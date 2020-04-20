class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: {
        scope: [:release_year, :artist_name],
        message: "The same song cannot be release twice."
      }
    validates :released, inclusion: {in: [true, false]}
    validates :release_year, presence: true, if: :released 
    validates :artist_name, presence: true
    validate :valid_year

    def valid_year
        if !release_year.nil?
            errors.add(:release_year , "invalid year") unless
            release_year <= Date.today.year
        end
    end

end
