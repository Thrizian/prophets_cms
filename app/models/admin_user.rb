class AdminUser < ApplicationRecord

  has_secure_password

  has_and_belongs_to_many :pages

  has_many :section_edits
  has_many :sections, through: :section_edits

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  validates :first_name,  presence: true,
                          length: { maximum: 25 }

  validates :last_name,   presence: true,
                          length: { maximum: 50 }

  validates :email,       presence: true,
                          length: { maximum: 100 },
                          format: { with: EMAIL_REGEX },
                          confirmation: true

  validates :username,    presence: true,
                          length: { within: 3..25 },
                          uniqueness: true

  validates :password,    confirmation: true

  scope :sorted, lambda { order(:last_name, :first_name) }

  def full_name
    "#{first_name} #{last_name}"
  end
end
