class Produto < ApplicationRecord

    belongs_to :departamentos

    validates :quantidade, presence: true
    validates :nome, length: { minimum: 5}
end
