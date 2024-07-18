class Topic < ApplicationRecord
  belongs_to :user
  has_many :blogs
  has_many :admins
end
