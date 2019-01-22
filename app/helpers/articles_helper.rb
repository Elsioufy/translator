module ArticlesHelper

  def article_truncate(value, number=100)
    value.truncate(number)
  end
end
