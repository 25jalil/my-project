json.array!(@posts) do |post|
  json.extract! post, :id, :title
  json.start post.created_at
  json.url post_url(post, format: :html)
end
