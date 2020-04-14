module ApplicationHelper
  def full_title(page_title = "")
    base_title = "System Dashboard"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def admin_full_name(admin)
    "#{admin.username}: #{admin.last_name} #{admin.first_name}"
  end
end
