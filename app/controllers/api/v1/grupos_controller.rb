module Api
	module V1
		class GruposController < ApplicationController   
            def index
				grupos = Grupo.order('nome desc');
				render json: {status: 'SUCCESS', message:'Grupos carregados', data:grupos},status: :ok
			
			end

			# Listar  passando ID
			def show
				grupo = Grupo.find(params[:id])
					render json: {status: 'SUCCESS', message:'Grupo carregado', data:grupo},status: :ok
			rescue ActiveRecord::RecordNotFound
				grupo = nil
				render json: {status: '400', message:'Registro não encontrado'},status: 400	
			end
			# Criar um novo Grupo
			def create
				grupo = Grupo.new(grupo_params)
				if grupo.save
					render json: {status: 'SUCCESS', message:'Grupo salvo com sucesso', data:grupo},status: :ok
				else
					render json: {status: 'ERROR', message:'Erro ao salvar grupo', data:grupo.errors},status: :unprocessable_entity
				end
			end
			# Excluir Grupo
			def destroy
				grupo = Grupo.find(params[:id])
				grupo.destroy
				render json: {status: 'SUCCESS', message:'Grupo excluído', data:grupo},status: :ok
			rescue ActiveRecord::RecordNotFound
				grupo = nil
				render json: {status: '400', message:'Registro não encontrado'},status: 400
			end
			# Editar Grupo
			def update
				grupo = Grupo.find(params[:id])
				if grupo.update(grupo_params)
					render json: {status: 'SUCCESS', message:'Grupo editado com sucesso', data:grupo},status: :ok
				else
					render json: {status: 'ERROR', message:'Erro ao editar um grupo', data:grupo.errors},status: :unprocessable_entity
				end
			end
			# Parametros aceitos
			private
			def grupo_params
				params.permit(:nome)
				
			end

		end
	end
end