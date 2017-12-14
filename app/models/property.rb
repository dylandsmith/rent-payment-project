class Property < ApplicationRecord
   belongs_to :utilizes, polymorphic: true
   has_many :units, dependent: :destroy
   accepts_nested_attributes_for :units
end
