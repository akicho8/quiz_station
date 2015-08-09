# -*- coding: utf-8 -*-
module ApplicationHelper
  def html_title
    [AppConfig[:app_name], @page_title].compact.reverse.join(" - ")
  end

  def omake
    if current_user
      " 問題数#{Article.count} 答えた数#{current_user.answer_logs.count} マーク#{current_user.hide_marks.count}"
      " 問#{Article.count} 答#{current_user.answer_logs.count} マ#{current_user.hide_marks.count}"
    else
      ""
    end
  end
end
