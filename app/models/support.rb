class Support < ApplicationRecord
  extend FriendlyId
  friendly_id :subject, use: :slugged
  belongs_to :user
end
