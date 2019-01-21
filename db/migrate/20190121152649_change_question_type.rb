class ChangeQuestionType < ActiveRecord::Migration[5.2]
  def up
    change_column :articles, :question, :text
  end

  def down
    change_column :articles, :question, :string
  end
end
