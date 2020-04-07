# == Schema Information
#
# Table name: users
#
#  id                  :bigint           not null, primary key
#  current_sign_in_at  :datetime
#  current_sign_in_ip  :inet
#  email               :string
#  first_name          :string
#  is_admin            :boolean
#  last_name           :string
#  last_sign_in_at     :datetime
#  last_sign_in_ip     :inet
#  remember_created_at :datetime
#  remember_token      :string
#  sign_in_count       :integer          default(0), not null
#  username            :string           default(""), not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  team_id             :bigint
#
# Indexes
#
#  index_users_on_team_id   (team_id)
#  index_users_on_username  (username) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (team_id => teams.id)
#
class User < ApplicationRecord
  belongs_to :team, optional: true
  # has_many :system_has_admins
  # has_many :systems, through: :system_has_admins, source: :system

  before_save :get_last_name, :get_first_name, :get_email
  devise :ldap_authenticatable, :rememberable, :trackable

  scope :admins, -> do
    where(is_admin: true)
  end

  private

    def get_last_name
      last_name = Devise::LDAP::Adapter.get_ldap_param(username, "sn")
      self.last_name = last_name.first.force_encoding("UTF-8") unless last_name.nil?
    end

    def get_first_name
      first_name = Devise::LDAP::Adapter.get_ldap_param(username, "givenName")
      self.first_name = first_name.first.force_encoding("UTF-8") unless first_name.nil?
    end

    def get_email
      mail = Devise::LDAP::Adapter.get_ldap_param(username, "mail")
      self.email = mail.first.to_s unless mail.nil?
    end
end
