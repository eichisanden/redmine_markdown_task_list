require 'markdown_task_list_plugin'

Redmine::Plugin.register :redmine_markdown_task_list do
  name 'Redmine Markdown Task List plugin'
  author 'eichisanden'
  description 'Enable Markdown task list.'
  version '0.0.1'
  url 'https://github.com/eichisanden/redmine_markdown_task_list'
  author_url 'https://github.com/eichisanden/redmine_markdown_task_list'
end

Rails.configuration.to_prepare do
  Redmine::WikiFormatting.format_names.each do |format_name|
    formatter = Redmine::WikiFormatting.formatter_for(format_name)
puts format_name
    if format_name == "markdown" then
      formatter.send(:include, MarkdownTaskListPlugin::Patch) unless formatter.included_modules.include? MarkdownTaskListPlugin::Patch
    end
  end
end

