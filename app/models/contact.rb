class Contact < ApplicationRecord
  validates :name,                presence: true
  validates :contact_information, presence: true
  validates :message,             presence: true
end
