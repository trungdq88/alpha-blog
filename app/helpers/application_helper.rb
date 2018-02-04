module ApplicationHelper
  def gavatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag url, alt: user.username + "'s avatar", class: 'rounded-circle'
  end

  def bootstrap_paginate(items)
    will_paginate items, renderer: WillPaginate::ActionView::BootstrapLinkRenderer
  end
end
