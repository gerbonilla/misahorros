class Contact < ApplicationRecord

  validates :name, :description, :email, presence: true


end
