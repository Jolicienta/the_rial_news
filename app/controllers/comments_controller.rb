class CommentsController < ApplicationController

    def create
        @post = Post.find(params[:comment][:post_id])
        @comment = Comment.new(comment_params)
        @comment.user = current_user

        respond_to do |format|
            if @comment.save
                format.html { redirect_to post_path(@post.id), notice: 'El comentario fue creado.' }
            else
                format.html { redirect_to post_path(@post.id), notice: 'El comentario no fue creado.' }
            end
        end
    end

    def create_anonymous_comment
        @post = Post.find(params[:comment][:post_id])
        @comment = Comment.new(comment_params)
        @comment.user = nil
        # set other necessary attributes for anonymous comment
        respond_to do |format|
            if @comment.save
                format.html { redirect_to post_path(@post.id), notice: 'El comentario fue creado.' }
            else
                format.html { redirect_to post_path(@post.id), notice: 'El comentario no fue creado.' }
            end
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :post_id)
    end

end
