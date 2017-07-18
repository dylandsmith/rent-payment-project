class MaintanenceService < ApplicationRecord
  belongs_to :user
  belongs_to :unit
end
