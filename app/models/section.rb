# frozen_string_literal: true

# The section contains all the content for a page in html or txt
class Section < ApplicationRecord

  acts_as_list scope: :subject

  belongs_to :page
  has_many :section_edits
  has_many :admin_users, through: :section_edits

  scope :visible, -> { where(visible: true) }
  scope :invisible, -> { where(visible: false) }
  scope :sorted, -> { order('position ASC') }
  scope :newest_first, -> { order('created_at DESC') }

  CONTENT_TYPES = %w[text HTML].freeze

  validates_presence_of :name
  validates_length_of :name, maximum: 255
  validates_inclusion_of :content_type,
                         in: CONTENT_TYPES,
                         message: "must be one of: #{CONTENT_TYPES.join(', ')}"
  validates_presence_of :content
end
