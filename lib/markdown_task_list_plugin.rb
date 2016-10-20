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
        html = html.gsub(/\[[xX]\]/) do |match|
          %(<input type="checkbox" checked>)
        end
        html = html.gsub(/\[ \]/) do |match|
          %(<input type="checkbox">)
        end
      end
    end
  end
end

