require File.dirname(__FILE__) + '/lib/markdown_task_list_plugin'

Redmine::Plugin.register :redmine_markdown_task_list do
  name 'Redmine Markdown Task List plugin'
  author 'eichisanden'
  description 'This plugin adds Task List to Markdown wiki formatting.'
  version '1.0.3'
  url 'https://github.com/eichisanden/redmine_markdown_task_list'
  author_url 'https://github.com/eichisanden'
  requires_redmine :version_or_higher => '3.0.0'
end

Rails.application.config.after_initialize do
  Redmine::WikiFormatting.format_names.each do |format_name|
    if format_name == "markdown" || format_name == "common_mark" then
      formatter = Redmine::WikiFormatting.formatter_for(format_name)
      formatter.prepend(MarkdownTaskListPlugin::ToHtmlWithTaskList)
    end
  end
end
