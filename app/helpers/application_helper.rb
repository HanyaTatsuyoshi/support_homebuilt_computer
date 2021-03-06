module ApplicationHelper
  
  #ぺーじごとの完全なタイトルを返します。
  def full_title(page_title = '')
    base_title = "自作PCパーツ.com"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
  
  # 渡されたユーザーがカレントユーザーであればtrueを返す
  def current_user?(user)
    user && user == current_user
  end
end
