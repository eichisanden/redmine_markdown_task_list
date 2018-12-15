require 'markdown_task_list_plugin'

Redmine::Plugin.register :redmine_markdown_task_list do
  name 'Redmine Markdown Task List plugin'
  author 'eichisanden'
  description 'This plugin adds Task List to Markdown wiki formatting.'
  version '1.0.2'
  url 'https://github.com/eichisanden/redmine_markdown_task_list'
  author_url 'https://github.com/eichisanden/redmine_markdown_task_list'
  requires_redmine :version_or_higher => '3.0.0'
end

Rails.configuration.to_prepare do
  Redmine::WikiFormatting.format_names.each do |format_name|
    formatter = Redmine::WikiFormatting.formatter_for(format_name)
    if format_name == "markdown" then
      formatter.prepend(MarkdownTaskListPlugin::ToHtmlWithTaskList)
    end
  end
end

