require_dependency 'issue'

module RedmineAgileKe
  module Patches

    module AgileColorPatch
      def self.included(base)
        base.class_eval do
          AgileColor::AGILE_COLORS[:pink] = 'pink'
          AgileColor::AGILE_COLORS[:peachpuff] = 'peachpuff'
        end
      end
    end

  end
end

unless AgileColor.included_modules.include?(RedmineAgileKe::Patches::AgileColorPatch)
  AgileColor.send(:include, RedmineAgileKe::Patches::AgileColorPatch)
end
