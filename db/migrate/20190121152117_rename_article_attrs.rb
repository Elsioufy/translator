class RenameArticleAttrs < ActiveRecord::Migration[5.2]
  def up
    rename_column :articles, :title, :question
    rename_column :articles, :body, :answer
  end

  def down
    rename_column :articles, :question, :title
    rename_column :articles, :answer, :body
  end
end
