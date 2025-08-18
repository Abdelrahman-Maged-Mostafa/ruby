module ApplicationHelper
    def gravatar_for(user,option = {size: 80})
        email_address = user.email
        hash = Digest::MD5.hexdigest(email_address)
        image_src = "https://www.gravatar.com/avatar/#{hash}?s=#{option[:size]}"
        image_tag(image_src,alt:user.username)
    end
end
