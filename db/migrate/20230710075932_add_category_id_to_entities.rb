# frozen_string_literal: true

class AddCategoryIdToEntities < ActiveRecord::Migration[7.0]
  def change
    add_reference :entities, :category, null: false, foreign_key: true
  end
end
