class User < ApplicationRecord
  has_many :customs, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates_acceptance_of :agreement, allow_nil: false, on: :create
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable, :lockable
end
