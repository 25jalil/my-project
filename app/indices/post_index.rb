ThinkingSphinx::Index.define :post, :with => :real_time do
  indexes title, as: :title_content
  indexes body, as: :content
  indexes comments.body, as: :comment_content
  indexes created_at, sortable: true
end
