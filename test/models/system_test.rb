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
require 'test_helper'

class SystemTest < ActiveSupport::TestCase
  def setup
    @system = systems(:one)
  end

  test "should be valid" do
    assert @system.valid?
  end
end
