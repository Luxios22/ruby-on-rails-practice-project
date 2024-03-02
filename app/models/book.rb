# frozen_string_literal: true

class Book < ApplicationRecord
  has_one :borrowing, -> { where active: true }
  has_one :borrowing_user, through: :borrowing, source: :user
  has_one_attached :cover
  belongs_to :category
  validates :title, presence: true
  validates :author, presence: true
  validates :description, presence: true
  def self.ransackable_attributes(auth_object = nil)
    ["author", "isbn", "title", "category_id", "created_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    []
  end

  def borrowed?
    borrowing.present?
  end

  def borrowed_by?(user)
    borrowing_user == user
  end

  has_many :reservations, -> { where type: "Reservation" }

  def reserved?
    reservations.where(active: true).exists?
  end
end
