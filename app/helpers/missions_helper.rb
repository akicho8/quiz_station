# -*- coding: utf-8 -*-
module MissionsHelper
  def html_title
    [AppConfig[:app_name], @page_title].compact.reverse.join(" - ")
  end

  def mission_answer_body(answer_body)
    answer_body = answer_body.to_s
    answer_body = html_escape(answer_body)
    answer_body = simple_format(answer_body)
    answer_body = auto_link(answer_body)
    answer_body.html_safe
  end

  def mission_tag_list(tag_list)
    tag_list.collect{|e|link_to(e, polymorphic_path([:missions], :query => e))}.join(" ").html_safe
  end
end
