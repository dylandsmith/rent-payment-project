class Unit < ApplicationRecord
  belongs_to :property
  has_many :tenants
  has_many :maintanence_services
  has_one :delinquency
  
  require 'active_support'
  
  def self.due_date
    current_date = DateTime.now
    end_of_month = DateTime.now.end_of_month
    
    number_of_days = (end_of_month.day - current_date.day) + 1
  end
end
