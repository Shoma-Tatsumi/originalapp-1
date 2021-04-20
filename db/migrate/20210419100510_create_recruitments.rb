class CreateRecruitments < ActiveRecord::Migration[6.0]
  def change
    create_table :recruitments do |t|
      t.date       :event_date, null: false
      t.time       :start_time, null: false
      t.time       :end_time, null: false
      t.string     :place, null: false
      t.integer    :number_of_people, null: false
      t.integer    :category_id, null: false
      t.text       :description, null: false
      t.references :user, null: false, foreign_key: true
      t.integer    :prefecture_id, null: false
      t.timestamps
    end
  end
end
