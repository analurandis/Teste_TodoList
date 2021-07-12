class Tarefa < ApplicationRecord
    enum periodo: {manha:1, tarde:2, noite:3}
    belongs_to  :grupo,  required: false 
    
    validates :descricao,
        :presence   => true,
        :format     => {
            :with     => /[A-Za-z]+/,
            :message  => "caracteres inválidos"
        },
        length: { maximum: 200 ,too_long: "%{count} caracteres máximo permitido"}


    def attributes
        super.merge({'grupo' => grupo})
    end
end
