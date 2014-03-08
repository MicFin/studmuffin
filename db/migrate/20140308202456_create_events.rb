class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.datetime :startdate
      t.datetime :enddate
      t.date :allday

      t.timestamps
    end
  end
end
