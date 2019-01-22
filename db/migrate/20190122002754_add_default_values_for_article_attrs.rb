class AddDefaultValuesForArticleAttrs < ActiveRecord::Migration[5.2]
  def up
    change_column_default(:article_translations, :question, '')
    change_column_default(:article_translations, :answer, '')
  end

  def down
    change_column_default(:article_translations, :question, nil)
    change_column_default(:article_translations, :answer, nil)
  end
end
