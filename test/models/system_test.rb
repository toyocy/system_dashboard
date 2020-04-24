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
#  team_id     :bigint
#
# Indexes
#
#  index_systems_on_team_id  (team_id)
#
# Foreign Keys
#
#  fk_rails_...  (team_id => teams.id)
#
require 'test_helper'

class SystemTest < ActiveSupport::TestCase
  def setup
    @system = systems(:one)
  end

  test "should be valid" do
    assert @system.valid?
  end
end
