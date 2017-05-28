class ResourceList < ApplicationRecord
   belongs_to :property_owner_workspace
   has_many :properties, as: :resourcable


end
