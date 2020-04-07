# == Schema Information
#
# Table name: systems
#
#  id          :bigint           not null, primary key
#  description :text
#  is_active   :boolean          default(TRUE)
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  team_id     :bigint           not null
#
# Indexes
#
#  index_systems_on_team_id  (team_id)
#
# Foreign Keys
#
#  fk_rails_...  (team_id => teams.id)
#
class System < ApplicationRecord
  belongs_to :team
  has_many :servers
  has_many :system_has_admins, dependent: :destroy
  has_many :admins, through: :system_has_admins
  accepts_nested_attributes_for :system_has_admins, allow_destroy: true

  validates :name, length: { maximum: 50 }, presence: true, uniqueness: true
  validates :team_id, presence: true

  scope :available, -> do
    where(is_active: true)
  end
end
