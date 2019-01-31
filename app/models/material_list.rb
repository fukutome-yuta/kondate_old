class MaterialList < ApplicationRecord
    #Menuの子要素として関連付け
    belongs_to :menu
end
