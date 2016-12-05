class TaggedcommentsController < ApplicationController
    before_filter :authenticate_user!
    
    def create
        @taggedpost = TaggedPost.find(params[:tagged_post_id])
        @taggedcomment = @taggedpost.taggedcomments.create!(comment_params)
        @anonymous = params[:anonymous]
        if @anonymous
            @taggedcomment.username = "Anonymous"
        else
            @taggedcomment.username = current_user.username
        end
        @taggedcomment.user_id = current_user.id
        @taggedcomment.save
        
        respond_to do |format|
            format.html { redirect_to tagged_posts_path }
            format.js
        end
    end
    
    def index
        @taggedpost = TaggedPost.find(params[:tagged_post_id])
        @taggedcomments = @taggedpost.taggedcomments.order('created_at DESC')
    end
    
    def destroy
    
    end
    

    private
    def comment_params
      params.require(:taggedcomment).permit(:body)
    end
end
