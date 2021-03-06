# Pages are objects that contain sections and belong to subjects
# They are the core element needed for constructing navigation and URI
class Page < ApplicationRecord

  acts_as_list
  acts_as_list scope: :subject

  belongs_to :subject, optional: false
  has_many :sections
  has_and_belongs_to_many :admin_users

  scope :visible, -> { where(visible: true) }
  scope :invisible, -> { where(visible: false) }
  scope :sorted, -> { order('position ASC') }
  scope :newest_first, -> { order('created_at DESC') }

  validates :name,  presence: true,
                    length: { maximum: 255 }

  validates :permalink, presence: true,
                        length: { in: 3..255 },
                        uniqueness: true
end
