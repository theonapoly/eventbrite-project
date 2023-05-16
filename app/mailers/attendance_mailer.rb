class AttendanceMailer < ApplicationMailer
    default from: 'no-reply@monsite.fr'

    def attendance_email(attendance)
      # On récupère les instances users et admin pour ensuite pouvoir les passer à la view en @participants et @admin
      @users = attendance.users
      @admin = attendance.event.admin
      # On définit une variable @url qu'on utilisera dans la view d’e-mail
      @url = "http://monsite.fr/login"
       # C'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
       if @admin && @admin.email
        mail(to: @admin.email, subject: "Un nouveau participant s'est inscrit !")
       end
    end
end
