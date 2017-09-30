class CommentQuery
  def initialize(relation = Feature::Comment.includes(:commentable), **options)
    @relation = relation
    @options = options
  end
  
  def belongs_to(user)
    comments = @relation.where(user: user).order(created_at: :desc)
    @options[:per_page].present? ? comments.page(1).per(@options[:per_page]) : comments
  end
end