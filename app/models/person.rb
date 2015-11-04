class Person < ActiveRecord::Base
  has_and_belongs_to_many :openings
  before_create :initialize_inferred_fields


  protected
  def initialize_inferred_fields
    self.encoded_name = self.name
  end
end
