class AddBusinessCategoryToKindergartens < ActiveRecord::Migration[7.2]
  def change
    add_column :kindergartens, :business_category, :string
  end
end
