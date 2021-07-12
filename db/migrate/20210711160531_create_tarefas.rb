class CreateTarefas < ActiveRecord::Migration[6.1]
  def change
    create_table :tarefas do |t|
      t.string :descricao
      t.float :duracao
      t.integer :periodo
      t.datetime :conclusao
      t.integer :grupo_id

      t.timestamps
    end
  end
end
