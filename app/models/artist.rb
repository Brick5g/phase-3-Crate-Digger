class Artist < ActiveRecord::Base
  has_many :releases, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end