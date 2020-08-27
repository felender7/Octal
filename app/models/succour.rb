class Succour < ApplicationRecord
  extend FriendlyId
  friendly_id :course, use: :slugged
  belongs_to :user , optional: true
  has_one_attached :code

end
