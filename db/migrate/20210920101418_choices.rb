class Choices < ActiveRecord::Migration[6.0]
  def change
    drop_table :choices
  end
end
