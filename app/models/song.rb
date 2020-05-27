class Song < ApplicationRecord
    validates :title, presence: true
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, if: :released_already?
    validates :artist_name, presence: true

    validate :same_song, :future_release

    def released_already?
        released

    end


    def same_song
        Song.all.find_all{|s| s.title == title}.each do |s|
            if(s.release_year == release_year)
                errors.add(:title, "Cannot be repeated by the same artist in the same year")
            end
        end
    end

    def future_release
        if(release_year != nil)
            if(release_year > 2020)
                errors.add(:release_year, "Must be less than the current year.")

            end
        end

    end

end
