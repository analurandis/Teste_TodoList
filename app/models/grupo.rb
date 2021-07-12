
class Grupo < ApplicationRecord

    has_many  :tarefas#, join_table: 'tarefas'

    validates :nome,
    uniqueness: {message: "Grupo já existente"},
    :presence   => true,
    :format     => {
        :with     => /[A-Za-z]+/,
        :message  => "caracteres inválidos"
    },
    length: { maximum: 50 ,too_long: "%{count} caracteres máximo permitido"}


  def totalTarefas
    # Grupo.select("count(*)").joins(:tarefas).where("grupos.id = grupo_id").group("grupos.id")
    tarefas.count()
  end


  def totalTarefasDiaMes
    #tarefas.where("tarefas.created_at < '#{(Time.now - 5.days).utc.iso8601}'").group("tarefas.created_at").count()
    tarefas.where("created_at >= ?", Date.today.at_beginning_of_month).group("DATE(tarefas.created_at)").count()
  end

  def totalTarefasPeriodoMes
    #tarefas.where("tarefas.created_at < '#{(Time.now - 5.days).utc.iso8601}'").group("tarefas.created_at").count()
    tarefas.where("created_at >= ?", Date.today.at_beginning_of_month).group("tarefas.periodo").count()
  end
  def totalTarefasConcluidasMes
    #tarefas.where("tarefas.created_at < '#{(Time.now - 5.days).utc.iso8601}'").group("tarefas.created_at").count()
    tarefas.where("conclusao >= ?", Date.today.at_beginning_of_month).group("tarefas.periodo").count()
  end

  #def hora
  #  (Time.now - 5.days).utc.iso8601
  #end

  def attributes
    super.merge({
        'totalTarefas' => totalTarefas,
        'totalTarefasDiaMes' => totalTarefasDiaMes,
        'totalTarefasPeriodoMes' => totalTarefasPeriodoMes,
        'totalTarefasConcluidasMes'=>totalTarefasConcluidasMes})
  end
end
