class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.string :movie_title
      t.integer :duration
      t.string :date
      t.time :start_time
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
