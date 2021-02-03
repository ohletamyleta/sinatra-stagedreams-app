class CreateShowsTable < ActiveRecord::Migration[5.2]
  def change 
    create_table :shows do |t|
      t.string :title
      t.string :author
      t.string :role
      t.string :style
      t.string :composer
      t.integer :year_done
      t.string :theatre_company
      t.string :notes
      t.integer :user_id
    end
  end

end

