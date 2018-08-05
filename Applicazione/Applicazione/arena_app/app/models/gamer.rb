class Gamer < ApplicationRecord


    #attr_accessor :username, :email, :password, :password_confirmation

    before_save { self.email = email.downcase }


    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

    validates :username, length: {maximum: 10},
                         presence: true #ATTENZIONE AGLI ERRORI COMPILA SEMPRE PER OGNI COSA SCRITTA PERCHE QUI NON AVEVO MESSO  ':' E MI RICHIAMAVA UN ALTRA PAGINA
    validates :email, length:{maximum:255},
                      presence: true,
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: true

    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
    #validates_confirmation_of :password


end





#Gamer.create(username: "Michael Hartl", email: "mhartl@example.com",password: "foobar", password_confirmation: "foobar")
