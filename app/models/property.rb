class Property < ApplicationRecord
   belongs_to :utilizes, polymorphic: true
end
