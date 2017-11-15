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

  def slideshow_for(model, with_form = false)
    render(
      partial: 'components/slideshow/container',
      locals: {
        images: model.images,
        with_form: with_form
      }
    )
  end
end
