# -*- coding: utf-8 -*-
module ApplicationHelper
  def html_title
    [AppConfig[:app_name], @page_title].compact.reverse.join(" - ")
  end
end
