module ApplicationHelper
  def admin_full_name(admin)
    "#{admin.username}: #{admin.last_name} #{admin.first_name}"
  end
end
