require_relative '../../db/config'

# implement your Student model here
class Student < ActiveRecord::Base
  validates  :phone, :presence => true, :length => { :minimum => 10 }
  validates_uniqueness_of :email
  validates_format_of :email, :with => /([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})/,  :message => "Please use only regular emails!"
  validate :student_cannot_be_younger_than_five

  def name
    "#{first_name} #{last_name}"
  end

  def age  # should DRY up later!
    if DateTime.now.month < birthday.month
      DateTime.now.year - birthday.year - 1
    else 
      DateTime.now.year - birthday.year
    end
  end

 def student_cannot_be_younger_than_five
  if self.age < 5
   errors.add(:student, "can't be younger than 5")
  end
 end

 def phone_number
  if phone < 10
    errors.add(:student, "Number can't be less than 10 digits")
  end
 end

end


