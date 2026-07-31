class Artist < ActiveRecord::Base
  has_many :releases, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  default_scope { where(deleted_at: nil) }

  def destroy
    run_callbacks(:destroy) do
      update_column(:deleted_at, Time.current)
    end
  end
end