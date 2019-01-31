class Menu < ApplicationRecord
    has_many :material_lists, dependent: :destroy
    accepts_nested_attributes_for :material_lists, allow_destroy: true
end
