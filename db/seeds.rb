# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
require 'faker'
pre = 1;

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
CSV.foreach("db/files/contact.csv", csv_options) do |item|
  now = item["N° CLIENT"].to_i
  if pre != now

  puts "item > #{item["N° CLIENT"].to_i}"
     arg_contact = {
        id:                     item["N° CLIENT"].to_i,
        nb_departement:         item["Dep"],
        type_:                  item["TYPE"],
        type_plus:              item["Type détaillé"],
        entite:                 item["ENTITE"],
        nom:                    item["NOM"],
        fonction:               item["FONCTION"],
        portable:               Faker::PhoneNumber.phone_number,
        fixe:                   Faker::PhoneNumber.phone_number,
        email:                  Faker::Internet.email,
        adresse:                item["Adresse"],
        cp:                     item["CP"],
        ville:                  item["VILLE"],
        nb_habitant:            item["NBRE HAB"],
        commentaire:            item["action divers"],
        site:                   item["Site Web"],
     }

     contact = Contact.new(arg_contact)
     mandant_name = ['ATECT', 'OKATENT', 'CYRIA DIVERS', 'Ultra Crite','QUARTZO DIVERS', 'SAE DIVERS,BO ou jeux DIVERS', 'CARACOL Divers', 'vert bleu', 'SAE', 'Vert Bleu2', 'STRAB Ferradix']
     mandant_name.each do |mandant|
      if item[mandant]
        commentaire = Commentaire.new(mandant: mandant, input: item[mandant])
        commentaire.contact = contact
        commentaire.save
      end
    end
    contact.save
    pre = item["N° CLIENT"].to_i
  end
end
# Ultra Crite,OKATENT,CYRIA DIVERS,QUARTZO DIVERS,SAE DIVERS,BO ou jeux DIVERS,CJCJ Divers,CARACOL Divers,vert bleu,SAE  ,Vert Bleu2,ATECH,STRAB Ferradix,

# CSV.foreach("db/files/projet_100.csv", csv_options) do |item|
#   args = {
#       num_validation: item["N° validation"],
#       num_devis: item["numero devis ou SD"],
#       nom: item["Nom projet"],
#       num_contact: item["contact"],
#       precripteur: item["num prescripteur"],
#       date_devis: item["Date devis"],
#       descriptif: item["Descriptif général"],
#       montant: item["montant"],
#       FT: item["FT"],
#       montant_sans_FT: item["Montant sans FT"],
#       status: item["Statut"],
#       date_commande: item["Date commande"],
#       date_reception: item["Date reception"],
#       secteur: item["SECTEUR ACTIVITE"],
#       origine_projet: item["Origine projet"]
#   }

#   projet = Projet.new(args)
#   projet.save

#   end

#TO DO
 # - Lier contacts et projets
 # - importer fichier csv
 # - Regler doublon contacts
 # - Regler doublon projets
 # - Fonction creer projet / commentaire
 # - Fonction cumuler query


 # - Connecter commissions
 # - Connecter facture
 # - Faire interface


#doublon client
# 7862
# 8017
# 8472
# 8481
# 8490
# 8494
