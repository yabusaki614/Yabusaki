module ArticlesHelper
  def search_validate
    return false if !param_validate(:title, "タイトルを入力してください")
    return false if !param_validate(:body, "本文を入力してください")
    return false if !param_validate(:author, "著者を入力してください")
   # return false if !param_validate(:hour, "出発時間を入力してください")
    #return false if !param_validate(:minute, "出発時間を入力してください")
    #return false if !param_validate(:carType, "車種を入力してください")
    #return true
  end
  private
  def param_validate(key, message)
    if params[key] == ""
      flash[:alert] = message
      return false
    end

    return true
  end
end
