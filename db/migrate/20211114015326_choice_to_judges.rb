class ChoiceToJudges < ActiveRecord::Migration[6.0]
  def change
    add_column :judges, :choice, :text
  end
end
