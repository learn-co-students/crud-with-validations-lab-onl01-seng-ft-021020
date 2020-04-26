class Song < ApplicationRecord
  validates_presence_of :title, :genre 
  validates :released, inclusion: { in: [true, false] }

  include ActiveModel::Validations
  validates_with TitleValidator
  validates_with ReleaseYearValidator
end
