class Comment < ApplicationRecord
    belongs_to :commentable, polymorphic: true, inverse_of: :comment
 
end
