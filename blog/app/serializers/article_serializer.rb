class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :name, :content
  has_many :comments
  embed :ids, include: true

  def url
    article_url(object)
  end

  def attributes
    data = super
    data[:edit] = edit_article_url(object) if scope.admin?
    data
  end
end
