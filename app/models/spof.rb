class Spof < ApplicationRecord
   validates :name, presence:true ,length:{minimum:8,maximum:100}
    validates :label, presence:true,length:{minimum:30,maximum:250}
end
