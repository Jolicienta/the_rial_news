class ReactionsController < ApplicationController
    
    def new_user_reaction
        @user = current_user
        @post = Post.find(params[:post_id]) if params[:post_id]
        @kind = params[:kind]
        
        respond_to do |format|
            (@type == "post") ? @reaction = Reaction.new(user_id: @user.id, post_id: @post.id, reaction_type: @type, kind: @kind) : @reaction = Reaction.new(user_id: @user.id, comment_id: @comment.id, reaction_type: @type, kind: @kind)
            if @reaction.save!
                format.html { redirect_to post_path(@post), notice: 'La reaccion fue exitosamente creada' }
            else
                format.html { redirect_to post_path(@post), notice: 'Algo salio mal' }
            end
            end
        end            
    end

    def like
        @post = Post.find(params[:post_id]) if params[:post_id]
        @post.increment!(:likes_count)
        redirect_to @post
    end    

end
