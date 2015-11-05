class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :person
  belongs_to :opening
end
