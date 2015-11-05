class Person < ActiveRecord::Base
  has_and_belongs_to_many :openings
  before_create :initialize_inferred_fields

  def name
    self.first_name + ' ' + self.last_name
  end


  protected
  def initialize_inferred_fields
    self.encoded_name = self.name.gsub ' ' '-'
    self.status = 'new'
  end
end
