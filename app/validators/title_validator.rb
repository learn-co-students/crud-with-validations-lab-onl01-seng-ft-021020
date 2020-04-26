class TitleValidator < ActiveModel::Validator
  def validate(record)
    #binding.pry
    matches = record.class.all.select{|e| e.release_year == record.release_year}.select{|e| e.title == record.title}
    unless matches.empty?
      record.errors[:title] << "can not be the same as another within the same year"
    end
  end
end