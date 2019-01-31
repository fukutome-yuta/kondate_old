class UnitList < ApplicationRecord
    has_many :material_lists
    accepts_nested_attributes_for :material_lists, allow_destroy: true
end
