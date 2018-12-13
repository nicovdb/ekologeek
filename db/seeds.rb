# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

puts "Crée les flux"
trashes = ["Ordures ménagères résiduelles (Bordeaux Métropole : bac noir)",
"Déchets recyclables (Bordeaux Métropole : bac vert)",
"Verre",
"Déchets alimentaires (marc de café, thé, reste de repas...)",
"Mégots",
"Papiers",
"Carton",
"Canettes",
"Stylos",
"Cartouches d’encre",
"Piles et batteries",
"Lampes",
"Déchets d’équipements électriques et électronique (DEEE)",
"Consommables d’impression",
"Bois",
"Palettes",
"Mobilier de bureau",
"Plastique (emballages, bouteilles, gobelets)",
"Films et emballages plastique",
"Polystyrène",
"Bouteilles en plastique",
"Gobelets en papier / carton",
"Gobelets en plastique"]
trashes.each do |trash|
  Trash.create(name: trash, display: true)
end
puts "flux créés"

# if Rails.env.development?

#   puts "Create DZD Bordeaux Métropole"
#     Project.create(name: "Bordeaux Métropole")
#   puts "done"

#   puts "Destroy all previous CompanyKnowHows"
#     CompanyKnowHow.all.each do |c|
#       c.destroy
#     end
#   puts "done"

#   puts "Create CompanyKnowHows"
#     CompanyKnowHow.create(origin: "Facebook")
#     CompanyKnowHow.create(origin: "Linkedin")
#     CompanyKnowHow.create(origin: "Site internet")
#     CompanyKnowHow.create(origin: "Bouche à oreille")
#     CompanyKnowHow.create(origin: "Mail")
#     CompanyKnowHow.create(origin: "Presse")
#     CompanyKnowHow.create(origin: "Moteur de recherche")
#     CompanyKnowHow.create(origin: "Suggestion d'un·e / des collaborateur·rice·s")
#   puts "done"

#   puts "Destroy all previous TrashProviders"
#     TrashProvider.all.each do |t|
#       t.destroy
#     end
#   puts "done"

#   puts "Create TrashProviders"
#     TrashProvider.create(name: "Bordeaux Métropole")
#     TrashProvider.create(name: "Suez")
#     TrashProvider.create(name: "Veolia")
#     TrashProvider.create(name: "Elise Atlantique")
#     TrashProvider.create(name: "SX Environnement")
#     TrashProvider.create(name: "Sita")
#     TrashProvider.create(name: "Paprec")
#     TrashProvider.create(name: "Solution Recyclage 33")
#     TrashProvider.create(name: "Ecomicro")
#     TrashProvider.create(name: "GDE (groupe Ecore)")
#     TrashProvider.create(name: "Click Eco")
#     TrashProvider.create(name: "Pena")
#     TrashProvider.create(name: "Esay Tri / One Two Tri")
#     TrashProvider.create(name: "Les Détritivores")
#     TrashProvider.create(name: "Guyenne Environnement")
#     TrashProvider.create(name: "La Poste Recygo")
#   puts "done"

#   puts "Destroy all previous TrashWorkingTypes"
#     TrashWorkingType.all.each do |t|
#       t.destroy
#     end
#   puts "done"

#   puts "Create TrashWorkingTypes"
#     TrashWorkingType.create(trash: "Emballages (bouteilles, canettes...)")
#     TrashWorkingType.create(trash: "Vaisselle (gobelets de café et de fontaine à eau...)")
#     TrashWorkingType.create(trash: "Matériel informatique (ordinateurs, imprimantes, piles, cartouches d'encre,  téléphones...)")
#     TrashWorkingType.create(trash: "Fournitures de bureau (papiers, stylos, surligneurs...)")
#     TrashWorkingType.create(trash: "Biodéchets (marc de café, restes alimentaires...)")
#     TrashWorkingType.create(trash: "Logistique (film plastique, cartons, palettes...)")
#     TrashWorkingType.create(trash: "Mobilier (bureaux, fauteuils, rangements, porte-manteaux...)")
#     TrashWorkingType.create(trash: "Produits d'entretien (savon, essuie main, produits ménagers...)")
#     TrashWorkingType.create(trash: "Mégots")
#     TrashWorkingType.create(trash: "Ampoules")
#   puts "done"

#   puts "Destroy all previous dispositives"
#     Dispositive.all.each do |d|
#       d.destroy
#     end
#   puts "done"

#   puts "Create dispositives"
#     Dispositive.create(name: "Démarche RSE")
#     Dispositive.create(name: "Politique Développement Durable")
#     Dispositive.create(name: "Plan d'éco-responsabilité")
#     Dispositive.create(name: "EMAS (« Eco Management and Audit Scheme »)")
#     Dispositive.create(name: "Certification ISO 26000 ('RSE-RSO et Développement Durable')")
#     Dispositive.create(name: "Certification ISO 50001 ('Management Énergétique')")
#     Dispositive.create(name: "Certification ISO 14001 ('Management Environnemental')")
#     Dispositive.create(name: "Autres ISO")
#     Dispositive.create(name: "Agenda 21")
#     Dispositive.create(name: "Bilan carbone")
#     Dispositive.create(name: "Bilan de GES ('Gaz à Effet de Serre')")
#     Dispositive.create(name: "PDE / PDA ('Plan Déplacement Entreprise / Administration')")
#     Dispositive.create(name: "Non communiqué")
#   puts "doooooooooooooone"
#   AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# end
