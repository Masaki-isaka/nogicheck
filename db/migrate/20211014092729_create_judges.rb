class CreateJudges < ActiveRecord::Migration[6.0]
  def change
    create_table :judges do |t|
      t.boolean :is_answer
      t.references :question_sort, null: false, foreign_key: true

      t.timestamps
    end
  end
end
