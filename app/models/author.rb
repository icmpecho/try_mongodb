class Author
  include Mongoid::Document
  field :name, type: String
  validates :name, :uniqueness => true
end
