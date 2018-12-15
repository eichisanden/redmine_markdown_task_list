module MarkdownTaskListPlugin
  module ToHtmlWithTaskList
    def to_html(*args)
      html = super(*args)
      html = html.gsub(/\[[xX]\]/) do
        %(<input type="checkbox" checked disabled>)
      end
      html.gsub(/\[ \]/) do
        %(<input type="checkbox" disabled>)
      end
    end
  end
end

