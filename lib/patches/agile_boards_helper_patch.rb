require_dependency 'agile_boards_helper'

AgileBoardsHelper.module_eval do
  def agile_color_class(issue, options={})
    # Patch agile_color_class to support assignee colors.
    if options[:color_base]
      color = case options[:color_base]
      when AgileColor::COLOR_GROUPS[:issue]
        issue.color
      when AgileColor::COLOR_GROUPS[:tracker]
        issue.tracker.color
      when AgileColor::COLOR_GROUPS[:priority]
        issue.priority.color
      when AgileColor::COLOR_GROUPS[:spent_time]
        AgileColor.for_spent_time(issue.estimated_hours, issue.spent_hours)
      when AgileColor::COLOR_GROUPS[:project]
        issue.project.color
      when AgileColor::COLOR_GROUPS[:user]
        issue.assigned_to.try(:color) unless issue.assigned_to.blank?
      end
    else
      color = if RedmineAgile.tracker_colors?
        issue.tracker.color
      elsif RedmineAgile.issue_colors?
        issue.color
      elsif RedmineAgile.priority_colors?
        issue.priority.color
      elsif RedmineAgile.spent_time_colors?
        AgileColor.for_spent_time(issue.estimated_hours, issue.spent_hours)
      end
    end
    "#{RedmineAgile.color_prefix}-#{color}" if color && RedmineAgile.use_colors?
  end

  def agile_user_color(user, options={})
    # We don't want to support the default user color function.
    # All it does is color a tiny bit of the card border.
    return
  end
end
