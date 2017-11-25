module ApplicationHelper
  # OPTIMIZE classify helper
  def page_title(big_title, small_title)
    render partial: 'components/title',
      locals: { big_title: big_title, small_title: small_title }
  end

  # link_array: [{ path: , name: }]
  # last: name
  def breadcrumb(*link_array, last)
    render partial: 'components/breadcrumb', locals: {
      link_array: link_array, last: last
    }
  end

  def j_full_date(full_date)
    full_date.strftime('%Y年%m月%d日 - %H:%M:%S')
  end

  def nsfw_status
    session[:nsfw]
  end

  def img_thumb(img, ratio, avatar = false)
    render partial: 'components/img_thumb', locals: {
      img: img, ratio: ratio, avatar: avatar
    }
  end

  def current_user_avatar
    if user_signed_in?
      img_thumb(current_user.avatar_url || '/assets/unknown-user.png', '1_1', true)
    else
      img_thumb('/assets/unknown-user.png', '1_1', true)
    end
  end

  def country_for(member)
    if member.country
      country_template(member.country.code, member.country.name).html_safe
    else
      country_template(:unknown, '不明').html_safe
    end
  end

  def price_range(**args)
    p args
    discount = args[:discount].to_f || 0
    min = (args[:min].to_i * (1 - discount)).round
    max = (args[:max].to_i * (1 - discount)).round
    min == max ? "¥#{min}" : "¥#{min} - ¥#{max}"
  end

  def products_filter
    render "components/filter/products/container"
  end

  # It will receive :page, :per, :index
  # result will be index of object in full list
  def pagination_index(**args)
    page = args[:page] || 1
    per = args[:per] || 20
    index = args[:index]

    per * (page - 1) + index + 1
  end

  def cart_quantity
    session[:cart] ||= {}
    session[:cart].values.reduce(0, :+)
  end

  def price_meta(**options)
    options = {
      price: 0,
      strike: false,
      currency: '¥',
      style: :wow,
      size: 150,
      class_names: nil
    }.merge(options)

    price = number_with_delimiter(options[:price].to_i, delimiter: ",")

    meta = styling_price(
      price,
      options[:currency],
      options[:style],
      options[:class_names]
    )
    options[:strike] ? content_tag(:span, meta, class: 'b-line-through') : meta
  end

  def colors_grouped(color_ids, **options)
    options = {
      action: true
    }.merge(options)

    colors_grouped = Ec::Product::Color
      .includes(product: :discount)
      .where(id: color_ids)
      .group_by(&:product_id)

    render(
      "ec/shared/products_grouped/container", 
      colors_grouped: colors_grouped, action: options[:action]
    )
  end

private

  def country_template(code, name)
    "<span class='flag-icon flag-icon-#{code}' data-toggle='tooltip' data-placement='bottom' title='#{name}'></span>"
  end

  def styling_price(price, currency, style, class_names)
    case style
    when :wow
      content_tag :div, class: "b-product-price #{class_names}" do
        content_tag(:span, currency, class: 'b-price-currency') \
        + content_tag(:strong, price, class: 'b-price-cost')
      end
    when :normal
      content_tag(:span, "#{currency}#{price}", class: class_names)
    end
  end
end
