class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :masqueradable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable, :confirmable

  extend FriendlyId
  friendly_id :name, use: :slugged
  has_one_attached :avatar
  has_person_name

  has_many :notifications, as: :recipient
  has_many :services
  has_many :succours, dependent: :destroy
  has_many :supports, dependent: :destroy
end
