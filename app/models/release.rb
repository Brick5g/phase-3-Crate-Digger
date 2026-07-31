class Release < ActiveRecord::Base
  RELEASE_TYPES = ["Album", "Mixtape", "EP", "Single", "Compilation"].freeze

  belongs_to :artist

  validates :title, presence: true

  validates :release_year,
            numericality: {
              only_integer: true,
              allow_nil: true
            }

  validates :rating,
            inclusion: {
              in: 1..10,
              allow_nil: true
            }

  validates :release_type,
            inclusion: {
              in: RELEASE_TYPES,
              allow_nil: true
            }
  default_scope { where(deleted_at: nil) }

  def destroy
    run_callbacks(:destroy) do
      update_column(:deleted_at, Time.current)
    end
  end
end