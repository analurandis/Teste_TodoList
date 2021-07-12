module Api
	module V1
		class TarefasController < ApplicationController   
			
            def index
				tarefas = Tarefa.order('descricao desc');
				render json: {status: 'SUCCESS', message:'Tarefas carregadas', data:tarefas},status: :ok
			end

			def top10
				tarefas = Tarefa.order('created_at desc').limit(10)
				render json: {status: 'SUCCESS', message:'10 últimas tarefas criadas', data:tarefas},status: :ok
			end
			# Listar  passando ID
			def show
				tarefa = Tarefa.find(params[:id])
				render json: {status: 'SUCCESS', message:'Tarefa carregada', data:tarefa},status: :ok
			rescue ActiveRecord::RecordNotFound
				tarefa = nil
				render json: {status: '400', message:'Registro não encontrado'},status: 400	
			end
			# Criar um nova TAREFA
			def create
				tarefa = Tarefa.new(tarefa_params)
				if tarefa.save
					render json: {status: 'SUCCESS', message:'Tarefa salva com sucesso', data:tarefa},status: :ok
				else
					render json: {status: 'ERROR', message:'Erro ao salvar tarefa', data:tarefa.errors},status: :unprocessable_entity
				end
			end
			# Excluir TAREFA
			def destroy
				tarefa = Tarefa.find(params[:id])
				tarefa.destroy
				render json: {status: 'SUCCESS', message:'Tarefa Deletada', data:tarefa},status: :ok
			rescue ActiveRecord::RecordNotFound
				tarefa = nil
				render json: {status: '400', message:'Registro não encontrado'},status: 400	
			
			end
			# Editar TAREFA
			def update
				tarefa = Tarefa.find(params[:id])
				if tarefa.update(tarefa_params)
					render json: {status: 'SUCCESS', message:'Tarefa editada com sucesso', data:tarefa},status: :ok
				else
					render json: {status: 'ERROR', message:'Erro ao editar tarefa', data:tarefa.errors},status: :unprocessable_entity
				end
			
			end
			# Parametros aceitos
			private
			def tarefa_params
				#params.require(:tarefa).permit(:descricao)
				params.permit(:descricao,:duracao,:periodo,:conclusao,:grupo_id)
				
			end

		end
	end
end