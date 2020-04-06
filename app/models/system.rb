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
#
class System < ApplicationRecord
  has_many :servers
  
  validates :name, length: { maximum: 50 }, presence: true, uniqueness: true

  scope :available, -> do
    where(is_active: true)
  end
end
