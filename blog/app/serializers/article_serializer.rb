class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :name, :content
  has_many :comments
  embed :ids, include: true
  delegate :current_user, to: :scope

  def url
    article_url(object)
  end

  def attributes
    data = super
    data[:edit] = edit_article_url(object) if current_user.admin?
    data
  end
end
