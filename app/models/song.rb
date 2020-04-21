class Song < ApplicationRecord
    validates :title, presence: true 
    validates :title, uniqueness: true
    validates  :released, inclusion: {in: [true, false]}
    validates :artist_name, presence: true
    validate :future_date
    validates :release_year, presence: true, if: :released?

    private 
    def future_date
        if release_year.present? && release_year > Date.today.year
            errors.add(:release_year, "cannot be in the future")
        end  
    end 
end
