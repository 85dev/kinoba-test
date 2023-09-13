class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :picture_url
      t.string :pseudo
      t.string :favorite_genders
      t.string :hated_genders

      t.timestamps
    end
  end
end
