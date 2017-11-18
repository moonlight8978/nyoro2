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

private

  def country_template(code, name)
    "<span class='flag-icon flag-icon-#{code}' data-toggle='tooltip' data-placement='bottom' title='#{name}'></span>"
  end
end
