class CreateGrades < ActiveRecord::Migration[5.0]
  def change
    create_table :grades do |t|

      t.belongs_to :student, index: true
      t.belongs_to :subject, index: true
      t.float :mark
      t.datetime :exam_date
      
      t.timestamps
    end
  end
end
