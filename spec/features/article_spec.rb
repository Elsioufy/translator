require "rails_helper"

# This feature spec is used to test our article as an admin and as a user.
feature Article, :type => :feature do
  feature "As an admin" do
    scenario "Goes to the dashboard" do
      visit rails_admin.dashboard_path
      expect(current_path).to eq rails_admin.dashboard_path
      visit rails_admin.index_path(model_name: 'article')
      page.find('ul.root_links .dashboard_root_link a').click # to a root action
      expect(current_path).to eq rails_admin.dashboard_path
    end

    scenario "lists articles in dashboard" do
      create_list :article, 3
      visit rails_admin.index_path(model_name: 'article')
      expect(current_path).to eq rails_admin.index_path(model_name: 'article')
      visit rails_admin.dashboard_path
      page.find('[data-model=article] a').click
      expect(current_path).to eq rails_admin.index_path(model_name: 'article')
    end

    scenario "creates an article in dashboard" do
      visit rails_admin.new_path(model_name: 'article')
      expect(current_path).to eq rails_admin.new_path(model_name: 'article')
      fill_in "Question", with: Faker::Lorem.paragraph(1)
      fill_in "Answer", with: Faker::Lorem.paragraph(100)
      click_button("Save")
      expect(current_path).to eq rails_admin.index_path(model_name: 'article')
      expect(page.find('.alert')).to have_content 'Article successfully created'  
    end

    scenario "edits article in dashboard" do
      article = create(:article)
      visit rails_admin.edit_path(model_name: 'article', id: article.id)
      expect(current_path).to eq rails_admin.edit_path(model_name: 'article', id: article.id)
      fill_in "Question", with: Faker::Lorem.paragraph(1)
      fill_in "Answer", with: Faker::Lorem.paragraph(100)
      click_button("Save")
      expect(current_path).to eq rails_admin.index_path(model_name: 'article')
      expect(page.find('.alert')).to have_content 'Article successfully updated'  
    end
  end
  feature "As a user" do
    scenario "lists articles and views one of them" do
      # Assuming our pagination is 10
      articles = create_list :article, 6
      visit articles_path
      expect(current_path).to eq articles_path
      expect(page.find('.article-listing')).to have_selector('.post', count: articles.length)
      first_article = page.find('.article-listing').first('.post')
      first_article.find('.continue-reading a').click()
      expect(first_article.find('.question').text()).to eq page.find('#card-question').text()
    end

    scenario "views specific article" do
      article = create(:article)
      visit article_path(article)
      expect(current_path).to eq article_path(article)
      expect(article.question).to eq page.find('#card-question').text()
      expect(article.answer).to eq page.find('#card-answer').text()
    end
  end
end