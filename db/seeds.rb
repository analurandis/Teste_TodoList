50.times  do
	Tarefa.create({
		descricao: Faker::Book.title,
        duracao: 0.1,
        periodo: "manha",
        conclusao:DateTime.now

	})
end