class Property < ApplicationRecord
   belongs_to :utilizes, polymorphic: true
   has_many :units
end
