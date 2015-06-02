# collection :users do
#   entity     User
#   repository UserRepository
#
#   attribute :id,   Integer
#   attribute :name, String
# end

collection :posts do
  entity Post
  repository PostRepository

  attribute :id, Integer
  attribute :title, String
  attribute :body, String
end
