class AddUuidToKindergartens < ActiveRecord::Migration[7.2]
  def change
    add_column :kindergartens, :uuid, :uuid, default: "gen_random_uuid()", null: false

    # If the existing table has data and you need to backfill the UUIDs, you can do this:
    Kindergarten.reset_column_information
    Kindergarten.find_each do |k|
      k.update(uuid: SecureRandom.uuid)
    end

    # Remove the old ID column and set the UUID as the primary key
    remove_column :kindergartens, :id
    rename_column :kindergartens, :uuid, :id
    execute "ALTER TABLE kindergartens ADD PRIMARY KEY (id);"
  end
end
