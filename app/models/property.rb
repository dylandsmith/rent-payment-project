class Property < ApplicationRecord
   #belongs_to :utilizes, polymorphic: true
   has_and_belongs_to_many :users
   has_many :units
end
