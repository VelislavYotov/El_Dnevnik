class CreateSubjectGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :subject_groups do |t|

      t.belongs_to :subject, index: true
      t.belongs_to :group, index: true

      t.timestamps
    end
  end
end
