class Person < ActiveRecord::Base
  before_create :initialize_inferred_fields

  has_and_belongs_to_many :openings
  belongs_to :user
  has_many :votes

  validates_presence_of :first_name, :last_name, :picture_url, :message => "este obligatoriu"
  validates :picture_url, format: {with: URI.regexp, message: 'URL invalid' }

  def name
    first_name + ' ' + last_name
  end

  def pozitive_votes
    votes.where(:pozitive => true)
  end

  def negative_votes
    votes.where(:pozitive => false)
  end

  def safe_picture_url
    if picture_url?
      picture_url
    else
      'http://www.datastax.com/wp-content/plugins/all-in-one-seo-pack/images/default-user-image.png'
    end
  end

  protected
  def initialize_inferred_fields
    self.encoded_name = name.downcase.strip.gsub(' ','-').gsub(/[^\w-]/, '')
    person_with_same_encoded_name = Person.find_by_encoded_name(encoded_name)
    unless person_with_same_encoded_name.nil?
      self.encoded_name += "-" + rand(100).to_s
    end
    self.status = 'ok'
  end
end
