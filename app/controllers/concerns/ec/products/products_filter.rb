module Ec::Products::ProductsFilter
private

  def search
    Ec::Product.search_and_filter(
      search_and_filter_params
    )
  end

  def search_and_filter_params
    additional_params.merge({
      q: params[:q],
      types: params[:types],
      min_price: params[:min_price] || 0,
      max_price: params[:max_price],
      categories: params[:categories],
      order_by: params[:sort],
      reverse_sort: params[:reverse_sort]
    })
  end

  def additional_params
    {}
  end
end
