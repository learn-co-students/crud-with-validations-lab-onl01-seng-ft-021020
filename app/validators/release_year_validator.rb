class ReleaseYearValidator < ActiveModel::Validator
  def validate(record)
    if record.released && record.release_year == nil
      record.errors[:release_year] << 'Release Year can not be empty if song is released'
    end

    if record.respond_to?('release_year') && record.release_year && record.release_year > Time.now.year
      record.errors[:release_year] << 'can not be in the future!'
    end
  end
end