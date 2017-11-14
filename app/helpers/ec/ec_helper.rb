module Ec::EcHelper
  def catemenu_for(category_id)
    category = Ec::Category.find_by(id: category_id)
    categories = category && category.subs
    categories ||= Ec::Category.first_class
    
    render(
      partial: 'components/categories/container',
      locals: {
        category: category,
        categories: categories
      }
    )
  end
end
