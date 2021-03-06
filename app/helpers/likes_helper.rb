module LikesHelper
    def toggle_like_button(post, user)
        if user.liked?(post)
            link_to image_tag("like.png", size:"15", alt: "unlike", data: { toggle_src: image_path("unlike.png") }), dislike_post_path(post), class: "like", id: "unlike_button", method: :put, remote: true, data: { toggle_href: like_post_path(post), id: post.id }
        else
            link_to image_tag("unlike.png", size:"15", alt: "like", data: { toggle_src: image_path("like.png") }), like_post_path(post), class: "like", id: "like_button", method: :put, remote: true, data: { toggle_href: dislike_post_path(post), id: post.id }
        end
    end
    
    def toggle_like_tag_button(post, user)
        if user.liked?(post)
            link_to image_tag("like.png", size:"15", alt: "unlike", data: { toggle_src: image_path("unlike.png") }), dislike_tagged_post_path(post), class: "like", id: "unlike_button", method: :put, remote: true, data: { toggle_href: like_tagged_post_path(post), id: post.id }
        else
            link_to image_tag("unlike.png", size:"15", alt: "like", data: { toggle_src: image_path("like.png") }), like_tagged_post_path(post), class: "like", id: "like_button", method: :put, remote: true, data: { toggle_href: dislike_tagged_post_path(post), id: post.id }
        end
    end
end
