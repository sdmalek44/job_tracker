class Contact < ApplicationRecord
  validates_presence_of :name, :position, :email
  belongs_to :company
end
