class CommentsController < ApplicationController
    # before_action :find_post, only: [:destroy, :create]
    before_action :load_commentable, only: [:create, :new, :destroy,:index,:edit]

    def index
        @comments = @commentable.comments
    end

    def new 
    
        @comment = @commentable.comments.new
    end


    def edit
        respond_to do |format|
            format.js
            format.html { redirect_to @comment, notice: "Comment was successfully updated." }
            format.json { render :show, status: :ok, location: @comment }      
        end
    end

    def update
        respond_to do |format|
            if @comment.update(comment_params)
                format.js
              format.html { redirect_to @comment, notice: "Comment was successfully updated." }
              format.json { render :show, status: :ok, location: @comment }
            else
                format.js
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @comment.errors, status: :unprocessable_entity }
            end
          end
    end


    def create
        # @post = Post.find(params[:post_id])
        @comment = @commentable.comments.new(comment_params)
        if @comment.save
            respond_to do |format|
                format.js
                format.html {redirect_to [@commentable, :comments], notice: "Comments created"}
            end
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        if @comment.destroy
            respond_to do |format|
                format.js
                format.html {redirect_to [@commentable, :comments], notice: "Comment was successfully deleted!"}
                format.json { head :no_content }
            end
        end
    end    
    private

    # def find_post
    #     @post = Post.find(params[:post_id])
    # end

    def load_commentable
        resource, id = request.path.split('/')[1,2] #post/1, article/2
        @commentable = resource.singularize.classify.constantize.find(id)
    end

    def comment_params
        params.require(:comment).permit(:name, :body)
    end

end
