class Person < ActiveRecord::Base
  has_and_belongs_to_many :openings
  before_create :initialize_inferred_fields

  def name
    first_name + ' ' + last_name
  end


  protected
  def initialize_inferred_fields
    self.encoded_name = name.downcase.strip.gsub(' ','-').gsub(/[^\w-]/, '')
    puts encoded_name
    self.status = 'new'
  end
end
