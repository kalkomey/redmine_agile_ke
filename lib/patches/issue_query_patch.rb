require_dependency 'issue'

module RedmineAgileKe
  module Patches

    module IssueQueryPatch
      def self.included(base)
        base.class_eval do
          available_columns << QueryColumn.new(:position, :caption => :label_agile_position, :sortable => "#{AgileData.table_name}.position")
        end
      end
    end

  end
end

unless IssueQuery.included_modules.include?(RedmineAgileKe::Patches::IssueQueryPatch)
  IssueQuery.send(:include, RedmineAgileKe::Patches::IssueQueryPatch)
end