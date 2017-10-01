class LogQuery
  def initialize(relation = Feature::Log.includes(:loggable, :user), **options)
    @relation = relation
    @options = options
  end
  
  def comment(user = nil)
    relation = Feature::Log.includes({loggable: :commentable}, :user)
    comments = relation.order(created_at: :desc).where(action: :comment)
    comments = user.present? ? belongs_to_user(comments, user) : comments
    comments = @options[:per_page].present? ? pagination(comments) : comments
    comments
  end
  
  def db_edit(user = nil)
    edits = @relation
      .order(created_at: :desc)
      .where(classification: :db)
      .where.not(action: :comment)
    edits = user.present? ? edits.where(user: user) : edits
    edits = @options[:per_page].present? ? pagination(edits) : edits
    edits
  end
  
private  

  def belongs_to_user(relation, user)
    relation.where(user: user)
  end

  def pagination(relation)
    relation.page(1).per(@options[:per_page])
  end
end