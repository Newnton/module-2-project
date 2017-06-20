module UsersHelper

  def gravatar_for_eighty_px(user)
  gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
  gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}s=80"
  image_tag(gravatar_url, alt: user.email, class: "gravatar")
  end

  def gravatar_for_forty_px(comment)
  gravatar_id = Digest::MD5::hexdigest(comment)
  gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=40"
  image_tag(gravatar_url, alt: comment, class: "gravatar")
  end

end
