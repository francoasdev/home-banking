class ChangeNumberColumnTypeInCards < ActiveRecord::Migration[6.1]
  def change
    reversible do |dir|
      change_table :cards do |t|
        dir.up   { t.change :number, :string }
        dir.down { t.change :number, :bigint }
      end
    end
  end
end
