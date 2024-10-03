class CreateKindergartens < ActiveRecord::Migration[7.2]
  def change
    create_table :kindergartens, id: :string do |t|
      t.string :name
      t.string :state
      t.string :city
      t.string :address
      t.string :business_type
      t.string :phone_number
      t.string :email
      t.string :website
      t.text :description

      t.timestamps
    end
  end
end
