class User < ApplicationRecord
   has_and_belongs_to_many :properties
   has_and_belongs_to_many :units
   has_many :maintanence_services

   self.inheritance_column = :user_designation
   
   scope :property_owners, -> { where(user_designation: 'PropertyOwner') }
   scope :tenants, -> { where(user_designation: 'Tenant') }
   before_save :encrypt_password

   attr_accessor :password

   validates_confirmation_of :password
   validates_presence_of :password, :on => :create
   validates_presence_of :email
   validates_uniqueness_of :email

   def self.user_designation
      %w(PropertyOwner, Tenant)
   end

   def self.authenticate(email, password)
      user = find_by_email(email)
      if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
         user
      else
         nil
      end
   end

   def encrypt_password
      if password.present?
         self.password_salt = BCrypt::Engine.generate_salt
         self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
      end
   end
end
