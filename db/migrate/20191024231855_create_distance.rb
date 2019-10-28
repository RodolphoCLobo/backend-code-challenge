class CreateDistance < ActiveRecord::Migration[6.0]
  def change
    create_table :distances do |t|
      t.string      :origin
      t.string      :destination
      t.integer     :kilometers
      t.timestamps
    end
  end
end
