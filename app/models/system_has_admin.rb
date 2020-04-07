# == Schema Information
#
# Table name: system_has_admins
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  admin_id   :bigint
#  system_id  :bigint
#
# Indexes
#
#  index_system_has_admins_on_admin_id                (admin_id)
#  index_system_has_admins_on_system_id               (system_id)
#  index_system_has_admins_on_system_id_and_admin_id  (system_id,admin_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (admin_id => users.id)
#  fk_rails_...  (system_id => systems.id)
#
class SystemHasAdmin < ApplicationRecord
  belongs_to :system
  belongs_to :admin, class_name: "User"

  validates :system, presence: true
  validates :admin, presence: true, allow_nil: true
end
