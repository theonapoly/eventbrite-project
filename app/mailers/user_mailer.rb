class UserMailer < ApplicationMailer
    # Cette ligne permet de définir la valeur de default[:from]
    # Le hash default permet de définir tout un ensemble de valeurs par défaut : celles-ci sont écrasées si la méthode d'envoi d’e-mail définit une valeur autre
    default from: "no-reply@monsite.fr"

    def welcome_email(user)
        # On récupère l'instance user pour ensuite pouvoir la passer à la view en @user
        @user = user

        # On définit une variable @url qu'on utilisera dans la view d'e-mail
        @url = 'https://mosite.fr/login'

        #c'est cet appel à mail() qui permet d'envoyer l'e-mail en définissant destinataire et sujet 
        mail(to:@user.email, subject: 'Bienvenue chez nous')
    end
end
