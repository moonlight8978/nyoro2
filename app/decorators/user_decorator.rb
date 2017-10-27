class UserDecorator < ApplicationDecorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  def user_name
    (object.user_name.present? ? object.user_name : '無名')
  end

  def user_name_san
    "#{user_name}さん"
  end

  def full_name
    "#{object.last_name} #{object.first_name}"
  end

  def activation
    if object.confirmed_at && (object.confirmed_at > object.confirmation_sent_at)
      h.content_tag :label, 'activated', class: 'b-label create'
    else
      h.content_tag :label, 'not activated', class: 'b-label destroy'
    end
  end

  def role
    if object.is_admin?
      h.content_tag :label, 'admin', class: 'b-label create'
    elsif object.is_moderator?
      h.content_tag :label, 'moderator', class: 'b-label update'
    elsif object.is_user?
      h.content_tag :label, 'user', class: 'b-label'
    else
      h.content_tag :label, 'banned', class: 'b-label destroy'
    end
  end

  def social_provider
    object.provider && social(object.provider)
  end

private

  def social(provider)
    provider_name = provider.split('_').first
    h.content_tag :label, provider_name, class: "b-label #{provider_name}"
  end
end
