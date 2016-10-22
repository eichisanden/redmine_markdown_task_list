module MarkdownTaskListPlugin
  module Patch
    def self.included(base)
      base.send(:include, InstanceMethods)
      base.class_eval do
        unloadable
        alias_method_chain :to_html, :task_list
      end
    end

    module InstanceMethods
      def to_html_with_task_list
        html = to_html_without_task_list
        html = html.gsub(/\[[xX]\]/) do
          %(<input type="checkbox" checked disabled>)
        end
        html.gsub(/\[ \]/) do
          %(<input type="checkbox" disabled>)
        end
      end
    end
  end
end

