class CreateWorkouts < ActiveRecord::Migration[7.1]
  def change
    create_table :workouts do |t|
      t.string :name
      t.date :date
      t.integer :duration

      t.timestamps
    end
  end
end
