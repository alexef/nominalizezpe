class Person < ActiveRecord::Base
  has_and_belongs_to_many :openings
  belongs_to :user
  has_many :votes

  before_create :initialize_inferred_fields

  def name
    first_name + ' ' + last_name
  end

  def safe_picture_url
    if picture_url?
      return picture_url
    else
      return 'http://www.datastax.com/wp-content/plugins/all-in-one-seo-pack/images/default-user-image.png'
    end
  end

  protected
  def initialize_inferred_fields
    self.encoded_name = name.downcase.strip.gsub(' ','-').gsub(/[^\w-]/, '')
    self.status = 'ok'
  end
end
