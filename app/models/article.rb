class Article < ApplicationRecord
    validates :title, presence:true ,length:{minimum:8,maximum:100}
    validates :description, presence:true,length:{minimum:30,maximum:250}
end
#video 18 in part 4 rednder errors