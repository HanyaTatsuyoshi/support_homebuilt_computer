module ApplicationHelper
  
  #ぺーじごとの完全なタイトルを返します。
  def full_title(page_title = '')
    base_title = "自作PCパーツ選び方-見積もり"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
