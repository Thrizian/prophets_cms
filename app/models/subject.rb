# frozen_string_literal: true

# Subjects are allow for the grouping of pages in the navigation
class Subject < ApplicationRecord

  acts_as_list

  has_many :pages

  scope :visible, -> { where(visible: true) }
  scope :invisible, -> { where(visible: false) }
  scope :sorted, -> { order('position ASC') }
  scope :newest_first, -> { order('created_at DESC') }
  scope :search, ->(query) { where(['name LIKE ?', "%#{query}%"]) }

  validates :name,        presence: true,
                          length: { maximum: 255 }
end
