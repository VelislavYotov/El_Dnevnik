class CreateSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :subjects do |t|

      t.string :name
      t.integer :clas
      t.string :sub_type
      t.belongs_to :teacher, index: true

      t.timestamps
    end
  end
end
