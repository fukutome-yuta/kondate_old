class Menu < ApplicationRecord
    #MaterialListを子要素として持つ
    has_many :material_lists, dependent: :destroy # =>紐づけて削除する
    accepts_nested_attributes_for :material_lists, allow_destroy: true
end
