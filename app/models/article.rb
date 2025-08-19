class Article < ApplicationRecord
    belongs_to :user
    has_many :article_categories
    has_many :categories, through: :article_categories
    validates :title, presence:true ,length:{minimum:8,maximum:100}
    validates :description, presence:true,length:{minimum:30,maximum:250}
end
#video 5 in part 6 rednder errors