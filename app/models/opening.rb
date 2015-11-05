class Opening < ActiveRecord::Base
  has_and_belongs_to_many :people
  before_create :initialize_inferred_fields
  has_many :votes

  protected
  def initialize_inferred_fields
    self.encoded_name = self.name
  end
end
