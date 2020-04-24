# == Schema Information
#
# Table name: servers
#
#  id          :bigint           not null, primary key
#  description :text
#  hostname    :string           not null
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  system_id   :bigint
#
# Indexes
#
#  index_servers_on_system_id  (system_id)
#
# Foreign Keys
#
#  fk_rails_...  (system_id => systems.id)
#
class Server < ApplicationRecord
  belongs_to :system, optional: true

  validates :hostname, length: { maximum: 50 }, presence: true, uniqueness: true
  validates :url, length: { maximum: 500 }
end
