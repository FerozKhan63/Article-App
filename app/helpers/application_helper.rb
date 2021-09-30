module ApplicationHelper
    def commentable_type_check(commentable ,comment)
        # if comment.commentable_type == "Article"
        send("#{comment.commentable_type.underscore}_comment_path", commentable, comment)
  
        # end
    end    
end
