# == Schema Information
#
# Table name: teams
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Team < ApplicationRecord
  has_many :servers
  has_many :users
  validates :name, length: { maximum: 50 }, presence: true, uniqueness: true
end
