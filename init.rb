requires_redmine_crm :version_or_higher => '0.0.32' rescue raise "\n\033[31mRedmine requires newer redmine_crm gem version.\nPlease update with 'bundle update redmine_crm'.\033[0m"

require 'redmine'

Redmine::Plugin.register :redmine_agile_ke do
  name 'Redmine Agile plugin for Kalkomey'
  author 'Mike Mayo'
  description 'Extends Redmine Agile functionality'
  version '0.0.1'
  url ''
  author_url 'http://kalkomey.com'

  requires_redmine :version_or_higher => '2.6'
end

require 'redmine_agile_ke'
