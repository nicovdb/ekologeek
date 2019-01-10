# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

puts "Crée les flux"
trashes = [["Ordures ménagères résiduelles (Bordeaux Métropole : bac noir)", 0.25],
["Déchets recyclables (Bordeaux Métropole : bac vert)", 0.2],
["Verre", 0.4],
["Déchets alimentaires (marc de café, thé, reste de repas...)", 0.3],
["Mégots", 0.1],
["Papiers", 0.25],
["Carton", 0.06],
["Canettes", 0.04],
["Stylos", 0.04],
["Cartouches d’encre", 0.14],
["Piles et batteries", 0.17],
["Lampes", 0.03],
["Bois", 0.3],
["Palettes", 0.1],
["Plastique (emballages, bouteilles, gobelets)", 0.07],
["Films et emballages plastique", 0.02],
["Polystyrène", 0.02],
["Bouteilles en plastique", 0.02],
["Gobelets en papier / carton", 0.12],
["Gobelets en plastique", 0.12]]
trashes.each do |trash|
  Trash.create(name: trash.first, density: trash.last, display: true)
end
puts "flux créés"

puts "bin types en cours de créa"
bin_types = [["Ordures ménagères résiduelles (Bordeaux Métropole : bac noir)", 0.25],
["Déchets recyclables (Bordeaux Métropole : bac vert)", 0.2],
["Verre", 0.4],
["Déchets alimentaires (marc de café, thé, reste de repas...)", 0.3],
["Mégots", 0.1],
["Papiers", 0.25],
["Carton", 0.06],
["Canettes", 0.04],
["Stylos", 0.04],
["Cartouches d’encre", 0.14],
["Piles et batteries", 0.17],
["Lampes", 0.03],
["Bois", 0.3],
["Palettes", 0.1],
["Plastique (emballages, bouteilles, gobelets)", 0.07],
["Films et emballages plastique", 0.02],
["Polystyrène", 0.02],
["Bouteilles en plastique", 0.02],
["Gobelets en papier / carton", 0.12],
["Gobelets en plastique", 0.12]]
bin_types.each do |bin_type|
  BinType.create(name: bin_type.first, density: bin_type.last)
end
puts "bin types créés"

# puts "destroy db "

# NoAppReason.destroy_all
# AppReason.destroy_all
# ActionMade.destroy_all
# NoActionMade.destroy_all
# NotMadeReason.destroy_all
# PriorityAction.destroy_all
# UserBehaviourDiag.destroy_all
# UserBehaviourResult.destroy_all
# DiagAction.destroy_all
# CompanyBehaviour.destroy_all



# puts "ok"

puts "no app reason start"

no_reason_types = [ "Pas de raison et/ou pas de besoin de changer mes habitudes",
                "D'autres priorités à gérer",
                "Trop contraignant (changement d'organisation, d’habitudes, de procédures...)",
                "Peu / pas efficace",
                "Raisons financières",
                "Faute de temps",
                "Manque de soutien de la hiérarchie / des collaborateur·rices",
                "Manque d’information (intérêt, solutions, fournisseurs…)",
                "N’y pense pas",
                "Techniquement pas possible / compliqué (pas de poubelles, pas d’alternatives disponibles…)",

]

no_reason_types.each do |no_reason_type|
  NoAppReason.create(reason: no_reason_type, public: true)
end

puts "no app reason end"

puts "app_reason start"

reason_types = [ "Réduire mes impacts sur l’environnement",
                "Réduire les impacts de ma structure sur l’environnement",
                "Faire des économies financières pour moi",
                "Faire des économies financières pour ma structure",
                "Obligation de ma structure",
                "Participer à une démarche collective",
]

reason_types.each do |reason_type|
  AppReason.create(reason: reason_type, public: true)
end

puts "app reason end"

puts "not made reason start"

not_made_reason_types = [ "Pas de raison et/ou pas de besoin de changer mes habitudes",
                "D'autres priorités à gérer",
                "Trop contraignant (changement d'organisation, d’habitudes, de procédures...)",
                "Peu / pas efficace",
                "Raisons financières",
                "Faute de temps",
                "Manque de soutien de la hiérarchie / des collaborateur·rices",
                "Manque d’information (intérêt, solutions, fournisseurs…)",
                "N’y pense pas",
                "Techniquement pas possible / compliqué (pas de poubelles, pas d’alternatives disponibles…)"

]

not_made_reason_types.each do |not_made_reason_type|
  NotMadeReason.create(reason: not_made_reason_type, public: true)
end



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
