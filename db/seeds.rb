# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Order.delete_all
Candidature.delete_all
Availability.delete_all
Meeting.delete_all
Annonce.delete_all
Agent.delete_all
User.delete_all

# =============================USER===============================
User.create!(
  email: 'contact@realbeez.com',
  password: 'mulhouse68',
  civilité: 'Monsieur',
  nom: 'Administrateur',
  prénom: 'Realbeez',
  ville: 'Paris',
  admin: true
)

User.create!(
  email: 'shiwenly@gmail.com',
  password: 'mulhouse68',
  civilité: 'Monsieur',
  nom: 'Ly',
  prénom: 'steven',
  adresse: '90 avenue de Choisy, paris',
  ville: 'Paris',
  téléphone: '0642808389',
  statut: 'Agent',
  admin: true
)

Agent.create!(
  statut: "Approuvé",
  user_id: User.where("email = ? ", "shiwenly@gmail.com")[0].id
)

User.create!(
  email: 'ly.somchit@gmail.com',
  password: 'mulhouse68',
  civilité: 'Madame',
  nom: 'Ly',
  prénom: 'christine',
  adresse: 'rue saint-jacques, thann',
  ville: 'Thann',
  téléphone: '0651402566',
  statut: 'Agent'
)

Agent.create!(
  statut: "Approuvé",
  user_id: User.where("email = ? ", "ly.somchit@gmail.com")[0].id
)

User.create!(
  email: 'ly8thierry@gmail.com',
  password: 'mulhouse68',
  civilité: 'Monsieur',
  nom: 'Ly',
  prénom: 'thierry',
  adresse: '75 rue patay, Paris',
  ville: 'Paris',
  téléphone: '+447710168923',
  statut: 'Agent'
)

Agent.create!(
  statut: "Approuvé",
  user_id: User.where("email = ? ", "ly8thierry@gmail.com")[0].id
)

User.create!(
  email: 'ly8david@gmail.com',
  password: 'mulhouse68',
  civilité: 'Monsieur',
  nom: 'Ly',
  prénom: 'David',
  adresse: '86 rue nationale, Paris',
  ville: 'Paris',
  téléphone: '+971561216797',
  statut: 'Agent'
)

Agent.create!(
  statut: "Approuvé",
  user_id: User.where("email = ? ", "ly8david@gmail.com")[0].id
)

User.create!(
  email: 'immolaurent68@gmail.com',
  password: '123456',
  civilité: 'Monsieur',
  nom: 'Uhlen',
  prénom: 'Laurent',
  adresse: 'rue théodore boch, Lutterbach',
  ville: 'Lutterbach',
  téléphone: '0666774000',
  statut: 'Agent'
)

Agent.create!(
  statut: "Approuvé",
  user_id: User.where("email = ? ", "immolaurent68@gmail.com")[0].id
)

User.create!(
  email: 'convictionperso@gmail.com',
  password: '123456',
  civilité: 'Monsieur',
  nom: 'Kentzinger',
  prénom: 'Gaëtan',
  adresse: 'allée des magnolias, Thann',
  ville: 'Thann',
  statut: 'Agent'
)

Agent.create!(
  statut: "Approuvé",
  user_id: User.where("email = ? ", "convictionperso@gmail.com")[0].id
)

User.create!(
  email: 'snelcico@gmail.com',
  password: '123456',
  civilité: 'Monsieur',
  nom: 'Frattinger',
  prénom: 'Swen',
  adresse: 'quartier gare, 68700 Aspach-Le-Haut',
  ville: 'Aspach-Le-Haut',
  téléphone: '0649660207',
  statut: 'Agent'
)

Agent.create!(
  statut: "Approuvé",
  user_id: User.where("email = ? ", "snelcico@gmail.com")[0].id
)

User.create!(
  email: 'kentzinger.gregory@gmail.com',
  password: '123456',
  civilité: 'Monsieur',
  nom: 'Kentzinger',
  prénom: 'Grégory',
  adresse: 'grand rue, 68700 Steinbach',
  ville: 'Steinbach',
  statut: 'Agent'
)

Agent.create!(
  statut: "Approuvé",
  user_id: User.where("email = ? ", "kentzinger.gregory@gmail.com")[0].id
)

User.create!(
  email: 'david.belhadj@outlook.fr',
  password: '123456',
  civilité: 'Monsieur',
  nom: 'Belhadj',
  prénom: 'David',
  adresse: 'rue du 7 août, 68800 Thann',
  ville: 'Thann',
  statut: 'Agent'
)

Agent.create!(
  statut: "Approuvé",
  user_id: User.where("email = ? ", "david.belhadj@outlook.fr")[0].id
)

User.create!(
  email: 'noped@hotmail.fr',
  password: '123456',
  civilité: 'Monsieur',
  nom: 'Tritsch',
  prénom: 'Nicolas',
  adresse: 'parc Denise Ferrier, 68120 Pfastatt',
  ville: 'Pfastatt',
  statut: 'Agent'
)

Agent.create!(
  statut: "Approuvé",
  user_id: User.where("email = ? ", "noped@hotmail.fr")[0].id
)

User.create!(
  email: 'jeromebrandt@gmail.com',
  password: '123456',
  civilité: 'Monsieur',
  nom: 'Brandt',
  prénom: 'Jérome',
  adresse: 'rue de Soultz, 68700 Uffholtz',
  ville: 'Uffholtz',
  statut: 'Agent'
)

Agent.create!(
  statut: "Approuvé",
  user_id: User.where("email = ? ", "jeromebrandt@gmail.com")[0].id
)

User.create!(
  email: 'kalim.cp@gmail.com',
  password: '123456',
  civilité: 'Monsieur',
  nom: 'Merabet',
  prénom: 'Nebil',
  adresse: 'rue saint-jacques, 68800 Thann',
  ville: 'Thann',
  statut: 'Agent'
)

Agent.create!(
  statut: "Approuvé",
  user_id: User.where("email = ? ", "kalim.cp@gmail.com")[0].id
)

# User.create!(
#   email: 'christopher.bouffort@hotmail.com',
#   password: '123456',
#   civilité: 'Monsieur',
#   nom: 'Bouffort',
#   prénom: 'Christopher',
#   adresse: 'Theaterstrasse, 86152 Augsburg, Germany',
#   ville: 'Augsburg',
#   statut: 'Agent'
# )

# Agent.create!(
#   statut: "Approuvé",
#   user_id: User.where("email = ? ", "christopher.bouffort@hotmail.com")[0].id
# )

User.create!(
  email: 'cedric.durighello@gmail.com',
  password: '123456',
  civilité: 'Monsieur',
  nom: 'Durighello',
  prénom: 'Cédric',
  adresse: 'rue de Rixheim, 68390 Sausheim',
  ville: 'Sausheim',
  statut: 'Agent'
)

Agent.create!(
  statut: "Approuvé",
  user_id: User.where("email = ? ", "cedric.durighello@gmail.com")[0].id
)

User.create!(
  email: 'ricw75@yahoo.fr',
  password: '123456',
  civilité: 'Monsieur',
  nom: 'Wille',
  prénom: 'Ricardo',
  adresse: 'rue Coquillière, 75001 Paris',
  ville: 'Paris',
  statut: 'Agent'
)

Agent.create!(
  statut: "Approuvé",
  user_id: User.where("email = ? ", "ricw75@yahoo.fr")[0].id
)

# User.create!(
#   email: 'sylvain.bailly@yahoo.fr',
#   password: '123456',
#   civilité: 'Monsieur',
#   nom: 'Bailly',
#   prénom: 'Sylvain',
#   adresse: '160 1st street, Jersey City, NJ 07302, USA',
#   ville: 'Jersey City',
#   statut: 'Agent'
# )

# Agent.create!(
#   statut: "Approuvé",
#   user_id: User.where("email = ? ", "sylvain.bailly@yahoo.fr")[0].id
# )

User.create!(
  email: 'allison.bordes@gmail.com',
  password: '123456',
  civilité: 'Madame',
  nom: 'Bordes',
  prénom: 'Allison',
  adresse: 'rue Brunehaut, 57000 Metz',
  ville: 'Metz',
  statut: 'Agent'
)

Agent.create!(
  statut: "Approuvé",
  user_id: User.where("email = ? ", "allison.bordes@gmail.com")[0].id
)

User.create!(
  email: 'marion.verborg@gmail.com',
  password: '123456',
  civilité: 'Madame',
  nom: 'Verborg',
  prénom: 'Marion',
  adresse: 'avenue Mathurin Moreau, 75019 Paris',
  ville: 'Paris',
  statut: 'Agent'
)

Agent.create!(
  statut: "Approuvé",
  user_id: User.where("email = ? ", "marion.verborg@gmail.com")[0].id
)

User.create!(
  email: 'sana.zayane@gmail.com',
  password: '123456',
  civilité: 'Madame',
  nom: 'Zayane',
  prénom: 'Sana',
  adresse: 'rue de l\'Amiral Mouchez, 75014 Paris',
  ville: 'Paris',
  statut: 'Agent'
)

Agent.create!(
  statut: "Approuvé",
  user_id: User.where("email = ? ", "sana.zayane@gmail.com")[0].id
)

User.create!(
  email: 'celine@celaprod.com',
  password: '123456',
  civilité: 'Madame',
  nom: 'Gicquel',
  prénom: 'Céline',
  adresse: 'boulevard de la paix, 92400 Courbevoie',
  ville: 'Courbevoie',
  statut: 'Agent'
)

Agent.create!(
  statut: "Approuvé",
  user_id: User.where("email = ? ", "celine@celaprod.com")[0].id
)

User.create!(
  email: 'xavier.cuneo@gmail.com',
  password: '123456',
  civilité: 'Monsieur',
  nom: 'Cuneo',
  prénom: 'Xavier',
  adresse: 'Place Du Marché, 78530 Buc, France',
  ville: 'Buc',
  statut: 'Agent'
)

Agent.create!(
  statut: "Approuvé",
  user_id: User.where("email = ? ", "xavier.cuneo@gmail.com")[0].id
)

User.create!(
  email: 'orianegrimaud75@gmail.com',
  password: '123456',
  civilité: 'Madame',
  nom: 'Grimaud',
  prénom: 'Oriane',
  adresse: 'avenue de Choisy, 75013 Paris',
  ville: 'Paris',
  statut: 'Agent'
)

Agent.create!(
  statut: "Approuvé",
  user_id: User.where("email = ? ", "orianegrimaud75@gmail.com")[0].id
)

User.create!(
  email: 'lefebvre_arnaud@hotmail.com',
  password: '123456',
  civilité: 'Monsieur',
  nom: 'Lefebvre',
  prénom: 'Arnaud',
  adresse: '75018 Paris',
  ville: 'Paris',
  statut: 'Agent'
)

Agent.create!(
  statut: "Approuvé",
  user_id: User.where("email = ? ", "lefebvre_arnaud@hotmail.com")[0].id
)

User.create!(
  email: 'marina-ilic@hotmail.com',
  password: '123456',
  civilité: 'Madame',
  nom: 'Ilic',
  prénom: 'Marina',
  adresse: '1 Rue de Patay, Paris 13e Arrondissement, Île-de-France, France',
  ville: 'Paris',
  statut: 'Agent'
)

Agent.create!(
  statut: "Approuvé",
  user_id: User.where("email = ? ", "marina-ilic@hotmail.com")[0].id
)

# =========================Annonces===========================================

annonce = Annonce.create!(
  titre_annonce: 'Charmant F5 au coeur de Riedisheim (parking disponible)',
  type_de_bien: 'Appartement',
  meublé: 'Non meublé',
  surface: '100',
  pièces: '5',
  description:
  'Charmant F5 au coeur de Riedisheim (parking disponible)

Appartement de type F5, au 1er étage d’un immeuble calme de 2 étages, se composant d’un séjour ouvert sur une cuisine équipée, 4 chambres, d’un WC et d’une salle de bain.
Place de parking disponible dans la cour de l’immeuble.

Disponible immédiatement, aucun frais d’agence.

Loyer 690 euros et 90 euros de provision pour charges (garant exigé)
Téléphone : 06 66 77 40 00',
  loyer_mensuel: 780,
  adresse: '5 rue de la paix, Riedisheim',
  ville: 'Riedisheim',
  email: 'shiwenly@gmail.com',
  téléphone: '0642808389',
  statut: "active",
  price_cents: 50,
  user_id: User.where("email = ? ", "shiwenly@gmail.com")[0].id
)
# annonce.remote_photo_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1569945259/uygnlkuciqkafqczgrup.jpg"
# annonce.remote_photo1_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1569945261/xp7so01tjnbfddnwrbyx.jpg"
# annonce.remote_photo2_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1569945263/ng2llj4cmimqizcvczdn.jpg"
# annonce.save!


annonce = Annonce.create!(
  titre_annonce: 'Local commercial de 52 m2',
  type_de_bien: 'Autre',
  meublé: 'Non meublé',
  surface: '52',
  pièces: '2',
  description:
  'A louer local commercial de 52 m2 situé proche centre-ville d’Altkirch avec place de parkings juste en face.
Il comprend une belle pièce principale pouvant faire office d espace de vente, une seconde pièce à l’arrière ainsi qu’un w.c séparé et une petite cuisine.

loyer 600 euros HT et 20 euros de provision pour charges.

Disponible immédiatement et pas de frais d’agence à payer.',
  loyer_mensuel: 620,
  adresse: '9 route de Carspach, Altkirch',
  ville: 'Altkirch',
  email: 'shiwenly@gmail.com',
  téléphone: '0642808389',
  statut: "active",
  price_cents: 37500,
  user_id: User.where("email = ? ", "shiwenly@gmail.com")[0].id
)
annonce.remote_photo_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571059774/yxuidwmii30pnbcneebc.jpg"
annonce.remote_photo1_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571059778/ube8inxehl0yc7uksfhq.jpg"
annonce.remote_photo2_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571059780/hwpsup67kz8f5sscjb5j.jpg"
annonce.save!

annonce = Annonce.create!(
  titre_annonce: 'Proche musée, studio au rez-de-chaussée',
  type_de_bien: 'Appartement',
  meublé: 'Non meublé',
  surface: '30',
  pièces: '1',
  description:
  'Thann proche musée,
Studio à louer, au rez-de-chaussée d un petit immeuble calme.
Il comprend une pièce principale, une cuisine aménagée et une salle de bain avec WC.

Loyer: 260 €
Charges: 40€ (eau froide, entretien chaudière + commun)',
  loyer_mensuel: 300,
  adresse: '36 rue de la Halle, Thann',
  ville: 'Thann',
  email: 'ly.somchit@gmail.com',
  téléphone: '0651402566',
  statut: "active",
  price_cents: 37500,
  user_id: User.where("email = ? ", "ly.somchit@gmail.com")[0].id
)
annonce.remote_photo_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571062159/sswpmxh5h4vhjibbluju.jpg"
annonce.remote_photo1_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571062161/pgyjdobvt2w3dd5hgqjk.jpg"
annonce.remote_photo2_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571062165/sx52qpgvlkortmr9sbby.jpg"
annonce.save!

annonce = Annonce.create!(
  titre_annonce: 'Appartement 3 pièces 68 m², centre ville + parking',
  type_de_bien: 'Appartement',
  meublé: 'Non meublé',
  surface: '68',
  pièces: '3',
  description:
  'Situé proche centre ville à Altkirch avec grand parking public et commerce à proximité.

Appartement moderne, confortable et lumineux. 
Bon état. Il comprend un grand séjour ouvert sur une cuisine équipée (lave-vaisselle, grand frigo/congélateur, plaques de cuisson, four), 2 chambres et SDB.

Loyer : 630€/mois + 50€ de charges. 

Requis : CDI, garanties souhaitées, dépôt de garantie 1 mois.
Dossier locataire (garants) complet demandé (3 dernières fiches de paie, 2 derniers avis d\'imposition, contrat, copie recto-verso de la carte d\'identité).

Disponible immédiatement',
  loyer_mensuel: 600,
  adresse: '9 route de Carspach, Altkirch',
  ville: 'Altkirch',
  email: 'shiwenly@gmail.com',
  téléphone: '0642808389',
  statut: "active",
  price_cents: 37500,
  user_id: User.where("email = ? ", "shiwenly@gmail.com")[0].id
)
annonce.remote_photo_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571059975/cfdwxqa087pdje7wyerp.jpg"
annonce.remote_photo1_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571059977/akkjo0wrcifewh2cdbga.jpg"
annonce.remote_photo2_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571059981/lsivfupsyid5epfutrgk.jpg"
annonce.save!



# ========================PARIS===============================

# 1
annonce = Annonce.create!(
  titre_annonce: 'GRAND T2 55m² LECOURBE/PASTEUR',
  type_de_bien: 'Appartement',
  meublé: 'Meublé',
  surface: '55',
  pièces: '2',
  description:
  'Dans un bel immeuble 1930 au 3ème étage avec ascenseur et gardien, appartement de 55m² meublé comprenant entrée, séjour, cuisine équipée, chambre, salle de bain avec baignoire, WC séparés, dégagement avec placard/penderie. Chauffage collectif. Une cave complète cette offre. Loyer : 1300 euros/mois charges comprises.
  Loyer hors charges : 1200 euros.
  Contact par tel : 0678447589',
  loyer_mensuel: 1300,
  adresse: 'metro Pasteur, Paris, Île-de-France, France',
  ville: 'Paris',
  téléphone: '0678447589',
  statut: "active",
  price_cents: 37500,
  user_id: User.where("email = ? ", "shiwenly@gmail.com")[0].id
)

annonce.remote_photo_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571109367/g4bsoshw2hr5yxewvnuc.jpg"
annonce.remote_photo1_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571109368/n6di7qrtmbqq5nsgx2fz.jpg"
annonce.remote_photo2_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571109370/dgrm4lmbunkqariangyr.jpg"
annonce.save!

# 2
annonce = Annonce.create!(
  titre_annonce: 'Meublé Pte Auteuil 3pièces 61M2 Pte Auteuil refait à neuf',
  type_de_bien: 'Appartement',
  meublé: 'Meublé',
  surface: '61',
  pièces: '3',
  description:
  'Paris 16ème Porte d\'Auteuil, à deux pas du Village d\'Auteuil, appartement meublé 3 pièces, 61m2 refait à neuf (septembre 2019) au pied des métro, bus, taxi.
Entrée, double séjour, 1 chambre, pièce penderie, cuisine entièrement équipée, salle de bains avec lave-linge.
Charme de l\'ancien, parquets, cheminée. Ascenseur.
Convient à célibataire ou couple. Décoration soignée.
Bail annuel. Pas de colocation.

Joindre de préférence le matin ou le soir après 18h.',
  loyer_mensuel: 1985,
  adresse: 'Porte d\'Auteuil, Paris, Île-de-France, France',
  ville: 'Paris',
  téléphone: '0607670049',
  statut: "active",
  price_cents: 37500,
  user_id: User.where("email = ? ", "shiwenly@gmail.com")[0].id
)

annonce.remote_photo_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571109494/fnha1i2rwnyzemyguqur.jpg"
annonce.remote_photo1_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571109495/kcselb8hxax3pv04xsur.jpg"
annonce.remote_photo2_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571109497/geurdwreyk65p6r9hdmd.jpg"
annonce.save!

# 3
annonce = Annonce.create!(
  titre_annonce: 'T2 Paris 16',
  type_de_bien: 'Appartement',
  meublé: 'Meublé',
  surface: '38',
  pièces: '2',
  description:
  'Au cœur du quartier chic de Passy, dans une rue calme, au sein d\'un immeuble Haussmannien, se situe au rdc, un T2 rénové et lumineux d\'environ 38m2.
Il est composé d\'une pièce principale donnant sur rue intégrant une cuisine îlot fonctionnelle équipée (hotte intégrée dans le plan de travail), d\'une chambre avec son lit coffre, son coin bureau et son dressing. La salle de bain offre une grande douche et intègre les WC et les machines pour le linge.
L\'immeuble est sécurisé avec un digicode puis un interphone, l’appartement dispose également d’une porte renforcée.

A deux pas des stations de métro Passy (ligne 6), La Muette (ligne 9), et des gares Boulainvilliers et Maison de la radio (RER C).',
  loyer_mensuel: 1700,
  adresse: 'Rue des Vignes, Paris 16e Arrondissement, Île-de-France, France',
  ville: 'Paris',
  téléphone: '0601730554',
  statut: "active",
  price_cents: 37500,
  user_id: User.where("email = ? ", "shiwenly@gmail.com")[0].id
)

annonce.remote_photo_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571109538/hmn32mgyhcetgkblwemw.jpg"
annonce.remote_photo1_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571109539/ewgx3psqmdmjtsj2r1xy.jpg"
annonce.remote_photo2_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571109541/bchzqiadaiakrjyz7iyw.jpg"
annonce.save!

# 4
annonce = Annonce.create!(
  titre_annonce: 'Appartement meublé 2p Place de la Nation Paris 11',
  type_de_bien: 'Appartement',
  meublé: 'Meublé',
  surface: '42',
  pièces: '2',
  description:
  'Au sein d’un immeuble en pierre de taille de 1910, appartement de type T2 de 42m2 situé au 5ème étage (ascenseur) d’une copropriété très bien entretenue et sécurisée.

Lumineux et calme, l’appartement se compose d’une entrée, wc indépendants, belle salle de bains, grand salon avec cuisine ouverte et une chambre.

L’appartement a été intégralement rénové avec des matériaux et des équipements haut de gamme afin de répondre aux locataires les plus exigeants : plans de cuisine et de salle de bains en granit, chauffage individuel à inertie pilotable par smartphone, cuisine équipée, double réfrigérateur sous plan, nombreux rangements.

L’appartement est agrémenté des attributs de l’ancien parisien : parquets en chêne massif, 2 cheminées, belle hauteur sous plafond, moulures.

Situé à proximité immédiate de la Place de la Nation, à 150 mètres des lignes 1, 2, 6 et 9 du métro et de la ligne A du RER.',
  loyer_mensuel: 1450,
  adresse: 'Boulevard Voltaire, Paris 11e Arrondissement, Île-de-France, France',
  ville: 'Paris',
  téléphone: '0658557979',
  statut: "active",
  price_cents: 37500,
  user_id: User.where("email = ? ", "shiwenly@gmail.com")[0].id
)

annonce.remote_photo_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571109580/c5s7kxvilxz8d6096wrt.jpg"
annonce.remote_photo1_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571109581/nssifd3dxc4y3rbuek5v.jpg"
annonce.remote_photo2_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571109583/zewziax0nttkyfkx2mjj.jpg"
annonce.save!

# 5
annonce = Annonce.create!(
  titre_annonce: 'Appartement 53 m2 aux Batignolles Paris 17',
  type_de_bien: 'Appartement',
  meublé: 'Meublé',
  surface: '53',
  pièces: '2',
  description:
  'A Louer : Rare, la campagne à Paris, appartement 53m2 meublé sur cour calme et arboré situé au cœur des Batignolles (rue des Batignolles).

Comportant :
- Séjour 28m2
- Cuisine, Salle de Bain
- Chambre 12m2
- WC séparés

L\'appartement est très lumineux, il est situé au 4ème étage sans ascenseur. C’est une copropriété calme qui donne sur une jolie cour arborée à disposition exclusive des habitants de l\'immeuble.
Comportant également emplacement pour vélos.

L\'appartement est entièrement équipé : machine à laver, lave-vaisselle, four, four à micro-onde, plaques gaz, toaster, vaisselle, ustensiles de cuisine, hotte, télé écran plat 101cm, lit, linge de lit, canapé, table basse... Chauffe-eau gaz, Chauffage par convecteurs électriques.

Le quartier est très agréable avec beaucoup de commerces (boulangerie, boucherie, primeur, marché...), nombreux restaurants et cafés. Square des Batignolles à proximité ainsi que le parc Martin Luther King.

Métro : Place Clichy (13/2), Rome (2), Europe (3). Villiers, Pont Cardinet et à 10 mn de Saint Lazare

Visites possibles sur rendez-vous. Merci de me contacter via le site. en proposant au moins un créneau, je vous confirmerai la visite dans la demi-journée.

Merci d\'apporter le jour de la visite le dossier complet suivant
(Les dossiers non complets ne seront pas étudiés) :
- 3 derniers bulletins de salaires
- carte nationale d\'identité ou passeport
- garants ou avis d’imposition ou contrat de travail CDD/CDI
- caution:2 mois de loyer.
Les colocations ne sont pas acceptées. Nous demandons aux locataires de respecter le calme de la copropriété.

LOYER 1850,00 € + Charges locatives 120,00 € comprenant l’eau (hors électricité, gaz et internet)',
  loyer_mensuel: 1970,
  adresse: 'Rue de Rome, Paris 8e Arrondissement, Île-de-France, France',
  ville: 'Paris',
  téléphone: '0687760073',
  statut: "active",
  price_cents: 37500,
  user_id: User.where("email = ? ", "shiwenly@gmail.com")[0].id
)

annonce.remote_photo_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571109671/sgjtbbqo9rxlbbmkzrz4.jpg"
annonce.remote_photo1_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571109673/gq0jbricxwrwznizjxgd.jpg"
annonce.remote_photo2_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571109675/ivyp93x7i9ezmrbxktmz.jpg"
annonce.save!

# 6
annonce = Annonce.create!(
  titre_annonce: 'Appartement meublé à louer',
  type_de_bien: 'Appartement',
  meublé: 'Meublé',
  surface: '57',
  pièces: '3',
  description:
  'Paris 14ème, proche des métros, commerces, endroit calme, loue dans un petit immeuble entouré de verdure, un appartement 57m², lumineux, très bien meublé (machine à laver, sèche linge etc …) au RDC, 2 chambres, 1 salle de bain, grand salon avec cuisine équipée( plaque cuisinière, micro onde, four, réfrigérateur …), cave, libre le 17/11/2019
Loyer : 1600€/mois + 100€ charges
Contact : 0781263738',
  loyer_mensuel: 1700,
  adresse: 'Rue du Couedic, Paris 14e Arrondissement, Île-de-France, France',
  ville: 'Paris',
  téléphone: '0781263738',
  statut: "active",
  price_cents: 37500,
  user_id: User.where("email = ? ", "shiwenly@gmail.com")[0].id
)

annonce.remote_photo_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571109805/ca37q0d1gg9jlvfhypqi.jpg"
# annonce.remote_photo1_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571109673/gq0jbricxwrwznizjxgd.jpg"
# annonce.remote_photo2_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571109675/ivyp93x7i9ezmrbxktmz.jpg"
annonce.save!

# 7
annonce = Annonce.create!(
  titre_annonce: 'Appartement 57m2 tres lumineux montmartre caulaincourt',
  type_de_bien: 'Appartement',
  meublé: 'Meublé',
  surface: '57',
  pièces: '2',
  description:
  'Superbe appartement meublé de 57 m2 tout juste refait à neuf. Idéalement situé rue Francoeur, à 5 minutes du métro Lamarck-Caulaincourt.

Cet appartement traversant est niché au 4ème étage d’un immeuble ancien de grand standing, comprenant un ascenseur.

Il dispose d’une chambre au calme donnant sur cour, d’une salle d’eau, un double séjour de près de 30m2 et d’une cuisine toute équipée (four, four micro-ondes, réfrigérateur/congélateur, lave-vaisselle, plaques à induction, machine à laver/sécher le linge….).

Une cave est également fournie avec le bien.

Le bien est disponible à partir du 24 décembre et est loué meublé.

L’appartement offre des prestations de grand standing : parquet, radiateurs neufs et puissants, belle hauteur sous plafond, fibre, digicode, digik, porte blindée, mobilier de qualité,….

APPARTEMENT REFAIT A NEUF / LUMINEUX / CALME

Loyer de 2.100 euros charges comprises (charges = 90 euros)

Honoraires à la charge du locataire : 15 euros par m2, soit 855 euros.

Dépôt de garantie de 2 mois de loyer.',
  loyer_mensuel: 2100,
  adresse: 'Rue Caulaincourt, Paris 18e Arrondissement, Île-de-France, France',
  ville: 'Paris',
  téléphone: '0610737494',
  statut: "active",
  price_cents: 37500,
  user_id: User.where("email = ? ", "shiwenly@gmail.com")[0].id
)

annonce.remote_photo_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571110048/utblm2wlapeyvtbixdfi.jpg"
annonce.remote_photo1_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571110049/ylzzgrjcfrcho7h5umzi.jpg"
annonce.remote_photo2_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571110051/jdpj9rnphagpxraourgr.jpg"
annonce.save!

# 8
annonce = Annonce.create!(
  titre_annonce: 'Location appartement meublé - 3P - immédiat - Cambronne',
  type_de_bien: 'Appartement',
  meublé: 'Meublé',
  surface: '81',
  pièces: '3',
  description:
  'Location appartement meublé - immédiat
Metro Cambronne
Paris 15e

- 2 derniers étages plein sud
- Traversant
- Entièrement refait
- Balcon / Terrasse
- 2 chambres
- 1 grande salle de bain - douche italienne
- 2 WC
- Grand séjour avec cuisine ouverte (four, lave-vaisselle, plaque induction)

Libre immédiatement.',
  loyer_mensuel: 2500,
  adresse: 'Rue Blomet, Paris 15e Arrondissement, Île-de-France, France',
  ville: 'Paris',
  téléphone: '0768187168',
  statut: "active",
  price_cents: 37500,
  user_id: User.where("email = ? ", "shiwenly@gmail.com")[0].id
)

annonce.remote_photo_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571110094/uvkrxqaj2atvsipjddx8.jpg"
annonce.remote_photo1_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571110096/vfgs4b4gngyqtzzu3b1p.jpg"
annonce.remote_photo2_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571110098/axjxif8siuppkfqkaork.jpg"
annonce.save!

# 9
annonce = Annonce.create!(
  titre_annonce: 'Appt 89 m2 loué non meublé',
  type_de_bien: 'Appartement',
  meublé: 'Non meublé',
  surface: '90',
  pièces: '4',
  description:
  'Situé dans le 12 ème arrondissement de Paris proche Michel Bizot et de ses commerces, du bois de Vincennes, cet appartement familial en excellent état de 4 pièces est loué non meublé.

L\'entrée donne sur un séjour de 30 m² exposé plein sud qui s\'ouvre sur un petit extérieur et une cuisine toute équipée. L\'espace nuit se compose de 3 chambres, un dressing, une salle de bain, une salle d\'eau, deux WC.

Pour toute visite merci de me contacter au 06.26.83.52.26 ou au 06.58.55.33.34',
  loyer_mensuel: 2450,
  adresse: 'Porte de Charenton, Paris, Île-de-France, France',
  ville: 'Paris',
  téléphone: '0626835226',
  statut: "active",
  price_cents: 37500,
  user_id: User.where("email = ? ", "shiwenly@gmail.com")[0].id
)

annonce.remote_photo_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571110135/vwfaety7g9nw56ll78be.jpg"
annonce.remote_photo1_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571110137/v8bvshyubplamowhskbz.jpg"
annonce.remote_photo2_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571110141/tfz1uqqhn1hzzbatatm7.jpg"
annonce.save!

# 10
annonce = Annonce.create!(
  titre_annonce: 'Proche gare de Lyon appart 2 pièces pour étudiants',
  type_de_bien: 'Appartement',
  meublé: 'Meublé',
  surface: '36',
  pièces: '2',
  description:
  'Pour couple ou colocation 2 étudiants. 36m2 : 2 pièces à vivre, cuisine séparée, salle d\'eau, WC séparé. 3e étage, chauffage collectif. Cuisine équipée, loué meublé avec meubles et électroménager à discuter selon besoins. Style moulures, grandes fenêtres avec vues dégagées. 900 euros, charges et chauffage collectif compris. Possibilité bail 9 mois ou moins. Garanties demandées. Visites si dossier ok uniquement.',
  loyer_mensuel: 900,
  adresse: 'Avenue Daumesnil, Paris 12e Arrondissement, Île-de-France, France',
  ville: 'Paris',
  téléphone: '0658559170',
  statut: "active",
  price_cents: 37500,
  user_id: User.where("email = ? ", "shiwenly@gmail.com")[0].id
)

annonce.remote_photo_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571110204/dztjh9wuzs6jjss6qy6l.jpg"
annonce.remote_photo1_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571110206/mtmbdf10qixkw5o1wwar.jpg"
annonce.remote_photo2_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571110208/wel1k1orcanilxwhzr0a.jpg"
annonce.save!

# 11
annonce = Annonce.create!(
  titre_annonce: 'Appartement 2/3 pièces 65m² Métro Faidherbe',
  type_de_bien: 'Appartement',
  meublé: 'Non meublé',
  surface: '65',
  pièces: '3',
  description:
  'Appartement 2/3 pièces 65 m² entièrement refait à neuf, 1er étage avec ascenseur, exposé Est/Ouest sur rue et cour, calme et ensoleillé : Entrée, cuisine entièrement équipée, salon avec bibliothèque intégrée, salle à manger , chambre avec armoire/penderie, tête de lit et commode intégrées, salle d’eau équipée avec machine lavante/séchante, wc séparé. Chauffage électrique connecté, parquet, moulures, Hsp 2.80m, Grande cave. Possibilité parking (130€ c.c)',
  loyer_mensuel: 2025,
  adresse: 'Rue Titon, Paris 11e Arrondissement, Île-de-France, France',
  ville: 'Paris',
  téléphone: '0686782605',
  statut: "active",
  price_cents: 37500,
  user_id: User.where("email = ? ", "shiwenly@gmail.com")[0].id
)

annonce.remote_photo_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571110269/dl3lbnz1ghbdtyqp5fkx.jpg"
annonce.remote_photo1_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571110271/glyqrbc6x7zsehzxjbl5.jpg"
annonce.remote_photo2_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571110273/hoxbw5ifzrasjnzetp25.jpg"
annonce.save!

# 12
annonce = Annonce.create!(
  titre_annonce: 'Location appartement PARIS 10 METRO 7 LOUIS BLANC refait à neuf',
  type_de_bien: 'Appartement',
  meublé: 'Meublé',
  surface: '66',
  pièces: '4',
  description:
  'Très bel appartement de 66m2 au pied du métro 7 Louis Blanc à PARIS 10 et proche de toutes commodités (magasins, supermarché, restaurant, école, etc.). Situé au 4eme étage avec ascenseur d\'un immeuble en pierre de taille, cet appartement sera vous séduire par son charme (moulure, cheminées), son calme (sur cours intérieur) et son ensoleillement.
Il a entièrement été refait à neuf il y a un an (parquet chêne massif, murs, plafond, électricité, plomberie, Fenêtres aluminiums double vitrage).

L\'appartement se compose:
- Une cuisine/ Salle à manger de 14,7m2
- Une chambre parentale de 14,75m2
- Une seconde chambre de 13,75m2
- Un Salon de 16,15m2
- SdB de 4m2
- WC séparé
- Cave

L\'appartement est loué meublé et équipé.
La cuisine, les meubles d\'entrée ainsi que les meubles de salle de bain sont fait sur mesure. L\'électroménager est neuf.
Appartement disponible à partir du 1er novembre 2019. Il n\'attend plus que son locataire.

Location: 2150€ + 50€ charges soit 2200€/mois

Je me tiens à votre disposition pour plus d\'informations.',
  loyer_mensuel: 2200,
  adresse: 'Louis Blanc, Paris, Île-de-France, France',
  ville: 'Paris',
  téléphone: '0652656825',
  statut: "active",
  price_cents: 37500,
  user_id: User.where("email = ? ", "shiwenly@gmail.com")[0].id
)

annonce.remote_photo_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571110311/oiiqslg8qkf0lehal6zf.jpg"
annonce.remote_photo1_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571110313/n0qylatazknmboc80l19.jpg"
annonce.remote_photo2_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571110314/n5re4ebdosiuaa8ctony.jpg"
annonce.save!

# 13
annonce = Annonce.create!(
  titre_annonce: 'Location meublée appartement 2 pièces 30 m²',
  type_de_bien: 'Appartement',
  meublé: 'Meublé',
  surface: '30',
  pièces: '2',
  description:
  'Appartement moderne, confortable, chaleureux et lumineux au 5ème étage sans ascenseur. Commerce à proximité, à 5 minutes du métro ligne 14 (Bibliothèque François-Mitterrand). Loyer : 1000€/mois + 100 € charges incluant eau chaude/froide et chauffage centrale.
Entièrement refait à neuf en 2017, Cuisine équipée neuve (micro-onde, lave-vaisselle, grand frigo/congélateur, plaques de cuisson, lave-linge, nombreux rangements).
Requis : CDI, sérieuses garanties souhaitées, dépôt garantie 2 mois. Dossier locataire (garants) complet demandé (3 dernières fiches de paie (3 fois loyer/mois)), 2 derniers avis d\'imposition, contrat, copie recto-verso de la carte d\'identité). Disponibilité immédiate. ',
  loyer_mensuel: 1100,
  adresse: '75 rue patay, Paris, France',
  ville: 'Paris',
  téléphone: '',
  email: "ly8david@gmail.com",
  statut: "active",
  price_cents: 37500,
  user_id: User.where("email = ? ", "ly8david@gmail.com")[0].id
)

annonce.remote_photo_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571110387/y563rtibecfmtmxyy08x.jpg"
annonce.remote_photo1_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571110391/mlkhhxqmvxxarwavpesh.jpg"
annonce.remote_photo2_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571110393/gzmmui6bnlkvckpnqavv.jpg"
annonce.save!

# 14
annonce = Annonce.create!(
  titre_annonce: 'WICKERSCHWIHR magnifique maison neuve 127m2 sur terrain de 5 ares',
  type_de_bien: 'Maison',
  meublé: 'Non meublé',
  surface: '127',
  pièces: '5',
  description:
  'Loue maison neuve (1ère occupation), lumineuse sur Wickerschwihr dans un quartier résidentiel très calme
Terrain : environ 5 ares engazonné et arboré avec arrosage automatique
Maison rdc et 1er étage d\'environ 127.00m2 avec 2 belles terrasses de plus de 25 m2
RDC : un sas d\'entrée, une cuisine équipée ouverte avec plans de travail en granit poli, un grand salon séjour d\'environ 45m2 avec 3 grandes baies vitrées,un local technique, un wc avec lave-mains
1er étage : pièce sur toute hauteur (sans rampants), 3 chambres lumineuses, une salle de bains avec meuble lavabo, sèche serviettes, douche, baignoire, un wc séparé.
Garage : grand garage double de 7.00/6.00m avec porte automatique
Chemins d\'accès en béton architectural, éclairage extérieur des chemins + éclairage des terrasses
Pergola bioclimatique végétalisée sur façade sud
Équipements haut de gamme: Double-flux avec puits canadien, ballon d\'eau chaude thermodynamique, éclairage LED
Isolation très haut de gamme avec très faible consommation énergétique
Chauffage : récupération des calories par l\'échangeur dans la double flux + poêle à bois étanche + plancher chauffant électrique dans toutes les pièces sur thermostat individuel en période de très grand froid
Étanchéité optimisée à tous les niveaux permettant d\'avoir une inertie thermique optimale (confort intérieur au top)
Très faible consommation énergétique
Contrat d\'entretien en place pour les espaces verts et l\'entretien de la double-flux : 80.00€ /mensuel
Nous recherchons de personnes sérieuses, motivées et solvables.
Curieux s\'abstenir',
  loyer_mensuel: 1420,
  adresse: 'Wickerschwihr, Grand-Est, France',
  ville: 'Wickerschwihr',
  téléphone: '0617711183',
  statut: "active",
  price_cents: 37500,
  user_id: User.where("email = ? ", "shiwenly@gmail.com")[0].id
)

annonce.remote_photo_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571124691/lcflg9ezpz7ngrvt7sbw.jpg"
annonce.remote_photo1_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571124692/ejfjidao63qjfu6abivu.jpg"
annonce.remote_photo2_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571124694/xrsgk14qdniepzrkhcst.jpg"
annonce.save!

# 15
annonce = Annonce.create!(
  titre_annonce: 'Meublé 3 Pièces Mulhouse Dornach',
  type_de_bien: 'Appartement',
  meublé: 'Meublé',
  surface: '61',
  pièces: '3',
  description:
  'A louer, appartement meublé 3 pieces situé à Dornach (Chateau Zu-Rhein), proche station de tram, gare, accès autoroute, station vélocité, université, IUT... dans une petit copropriété de standing de 3 étages.

Entrée avec grand placard.

Salle de bain avec baignoire, vasque, et machine à laver. WC séparé.

Grande pièce à vivre orientée sud-ouest et donnant accès à un balcon de 4m2: canapé, meuble tv, bibliothèque, table et chaises.

Deux chambres à coucher de 10m2 chacune.

Une cuisine équipée, avec lave-vaisselle, frigo donnant accès à un petit balcon de 2m2.

Garage individuel pour un véhicule et une cave.

Chauffage individuel au gaz naturel

Loyer: 620 euros + 80 euros de charges (eau, entretien des communs, jardinière...). Appartement disponible à partir du 1er Novembre 2019.',
  loyer_mensuel: 700,
  adresse: 'Rue Thenard, Mulhouse, Grand-Est, France',
  ville: 'Mulhouse',
  téléphone: '0671150916',
  statut: "active",
  price_cents: 37500,
  user_id: User.where("email = ? ", "shiwenly@gmail.com")[0].id
)

annonce.remote_photo_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571124742/qtf7ug0hjnjcn6k9vdgb.jpg"
annonce.remote_photo1_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571124747/iprwlrtwoupg0emtsbin.jpg"
annonce.remote_photo2_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571124750/fx7mg7xmc2zffkawl0y7.jpg"
annonce.save!

# 16
annonce = Annonce.create!(
  titre_annonce: 'COLMAR Petite Venise F4 94m2 670',
  type_de_bien: 'Appartement',
  meublé: 'Non meublé',
  surface: '94',
  pièces: '4',
  description:
  'Colmar Duplex F4/5 quartier Petite Venise
3ème et dernier étage lumineux, transversal,
Surface habitable 94 m2 Surface utile 120 m2
Chauffage individuel au gaz

Cuisine meublée Salon Salle à manger
Trois chambres
Salle de bain: baignoire Salle d\'eau: douche

Commerces, écoles, collège, lycée, gare proche

Loyer 670 € Charges 45 € comprenant:
l\'eau, la taxe ordures ménagères, l\'électricité
des communs et l\'entretien de la chaudière

Tél. du propriétaire: 06 76 93 26 60',
  loyer_mensuel: 715,
  adresse: 'Colmar, Grand-Est, France',
  ville: 'Colmar',
  téléphone: '0676932660',
  statut: "active",
  price_cents: 37500,
  user_id: User.where("email = ? ", "shiwenly@gmail.com")[0].id
)

annonce.remote_photo_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571124807/fyguvov5j82ncefcev0f.jpg"
annonce.remote_photo1_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571124811/jxhwsodmhzg1zefm3a6t.jpg"
annonce.remote_photo2_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571124814/y4atydsknbufxwu7so4e.jpg"
annonce.save!

# 17
annonce = Annonce.create!(
  titre_annonce: 'Sublime F3 neuf de 88m2. Extremement lumineux',
  type_de_bien: 'Appartement',
  meublé: 'Non meublé',
  surface: '80',
  pièces: '3',
  description:
  'Mise en location d’un magnifique F3 de 88m2 proche centre ville de Altkirch

Équipé :
- D’une impressionnante pièce salon-cuisine de 45m2, avec superbe cuisine et poêle à pellets
- D’une grande salle de bain avec sèche serviettes, double vasque, WC suspendu, douche et baignoire
- Ainsi que de deux grandes et lumineuses chambres

Les plus :
- Poêle à pellets et chauffage au sol gaz de dernière génération (économe et comfortable)
- Cuisine neuve tout équipée
- Isolation et insonorisation très performante
- Vastes fenêtres double vitrage pour une belle luminosité
- 2 emplacements parking à l’arrière du bâtiment
- Porte d’entrée blindée
- Cave pour stocker petit matériel
Loyer 940 Euros + 40 Euros de charges mensuelles.
Disponible fin Octobre 2019',
  loyer_mensuel: 715,
  adresse: 'Altkirch, Grand-Est, France',
  ville: 'Altkirch',
  téléphone: '0685061031',
  statut: "active",
  price_cents: 37500,
  user_id: User.where("email = ? ", "shiwenly@gmail.com")[0].id
)

annonce.remote_photo_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571124852/loczqv4f3otsb1jzfq1q.jpg"
annonce.remote_photo1_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571124856/amheo6fmegg8ndsw12oq.jpg"
annonce.remote_photo2_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571124858/r5u6f4xspqxqrkjk7imy.jpg"
annonce.save!

# 18
annonce = Annonce.create!(
  titre_annonce: 'Appartement T4 avec GARAGE à SAINT-LOUIS',
  type_de_bien: 'Appartement',
  meublé: 'Non meublé',
  surface: '80',
  pièces: '4',
  description:
  'T4 avec balcon couvert de 13 m² et 1 garage au sous-sol, dans un immeuble collectif récent et de standing à SAINT-LOUIS, proche de l\'Aéroport et à 200 m de la gare SNCF de Saint-Louis la Chaussée (qui dessert Bâle).
L\'appartement avec ascenseur se trouve au 2ème et dernier étage du bâtiment avec un balcon sans vis à vis.
DESCRIPTIF DE L\'APPARTEMENT :
- cuisine équipée (évier, lave-vaisselle, four, plaque de cuisson, hotte, éléments hauts et bas, sauf frigo) ouverte sur séjour de 33 m² donnant sur un balcon couvert de 13 m²
- 1 chambre de 14 m²
- 1 chambre de 10 m²
- 1 chambre de 9 m²
- 1 salle de bains avec baignoire et attente pour machine à laver
- 1 WC séparé
L\'appartement dispose également d\'un garage au sous-sol :
- 1 grand garage (pour PMR) de 21 m², largeur 3.30 m, équipée d\'une porte basculante électrique et de prises (pour congélateur)

Possibilité de louer un 2ème garage de 18 m² au sous-sol, si souhaité.

PRESTATIONS :
- chauffage individuel au gaz
- double vitrage
- ascenseur
- fibre

Loyer : 920 €
Charges mensuelles comprenant l\'eau froide, entretien chaudière, ordures ménagères, charges des communs : 140 €
Dépôt de garantie : 920 €

L\'appartement est disponible début janvier 2020.
visite sur RDV tél 06 12 32 65 81',
  loyer_mensuel: 1060,
  adresse: 'Rue de la Barrière, Saint-Louis, Grand-Est, France',
  ville: 'Saint-Louis',
  téléphone: '0612626581',
  statut: "active",
  price_cents: 37500,
  user_id: User.where("email = ? ", "shiwenly@gmail.com")[0].id
)

annonce.remote_photo_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571124896/oo9jmdrlq7qcq1scgpdt.jpg"
annonce.remote_photo1_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571124898/w04b3ozeuun7lqoqgmjx.jpg"
annonce.remote_photo2_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571124901/rndp4fzsnny1smfg2c6m.jpg"
annonce.save!

# 19
annonce = Annonce.create!(
  titre_annonce: 'Colmar-Appartement neuf (1ère location).2 pièces 50 m2 environ Loyer 520 hors charges',
  type_de_bien: 'Appartement',
  meublé: 'Non meublé',
  surface: '50',
  pièces: '2',
  description:
  'Résidence L’EMPREINTE (Nouveau lotissement de La Croix Blanche).48 rue de Vienne
Dans résidence neuve, entourée d’espaces verts, face aux vignes et aux Vosges, très beau F2 de 50 m2 au 3è étage avec ascenseur comprenant :
-une entrée
-un séjour avec jolie cuisine neuve équipée ouvert sur une grande terrasse de 17 m2 exposée plein sud avec vue sur les Vosges
-une chambre avec accès à la terrasse
-une salle de bain avec douche italienne et WC
-un cellier
-un garage fermé de 17 m2 en souterrain
Chauffage collectif au gaz.
Loyer : 520€.
Charges locatives : 80€/mois environ.
La location est soumise au respect des plafonds de ressources de la loi Pinel
80€ de provisions sur charges (eau incluse) avec régularisation annuelle.
Le dépôt de garantie représente un mois de loyer hors charges soit 520€
Modalité de récupération des charges locatives : provision avec régularisation annuelle
PAS DE FRAIS D’AGENCE
Ce bien sera disponible en novembre
Téléphone : 06 08 89 49 71',
  loyer_mensuel: 600,
  adresse: 'Quai de la Sinn, Colmar, Grand-Est, France',
  ville: 'Colmar',
  téléphone: '0608498971',
  statut: "active",
  price_cents: 37500,
  user_id: User.where("email = ? ", "shiwenly@gmail.com")[0].id
)

annonce.remote_photo_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571124984/fqdeicw2u9w5ehjlumb0.jpg"
annonce.remote_photo1_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571124986/bjfj1kogq7uirksu6hy0.jpg"
annonce.remote_photo2_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571124989/lv1hbwnhfrtfaosdertg.jpg"
annonce.save!

# 20
annonce = Annonce.create!(
  titre_annonce: 'Spacieux/lumineux Appartement 89m2',
  type_de_bien: 'Appartement',
  meublé: 'Non meublé',
  surface: '89',
  pièces: '3',
  description:
  'Particulier loue charmant F3 de 89m2 dans petite copropriété, 1er étage sans ascenseur, au centre de Village-Neuf.
92 rue du Général de Gaulle
Avec balcon ensoleillé
Deux chambres
Grande cuisine équipée séparée
Salle de bain avec WC
Chaudière individuelle gaz (eau chaude et chauffage)

Appartement très propre, récemment repeint
Grande cave privative au sous-sol avec branchement lave-linge et sèche-linge
Parking dans cours privée
Local sécurisé pour vélos
Loyer 740EUR hors charge
Provision sur Charges 50 EUR/mois (frais de copropriété, ménage commun)

Disponible 01/11/19',
  loyer_mensuel: 790,
  adresse: 'Village-Neuf, Grand-Est, France',
  ville: 'Village-Neuf',
  téléphone: '0607456621',
  statut: "active",
  price_cents: 37500,
  user_id: User.where("email = ? ", "shiwenly@gmail.com")[0].id
)

annonce.remote_photo_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571125049/qwik1sh6xusgmsz0vd3s.jpg"
annonce.remote_photo1_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571125054/mf0x4bxnnkgjpdqanbyo.jpg"
annonce.remote_photo2_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571125061/n1jh16wcmp6bwotsrhim.jpg"
annonce.save!

# 21
annonce = Annonce.create!(
  titre_annonce: '2 pièces au 4B av de la 1ère DB.Rebberg Mulhouse',
  type_de_bien: 'Appartement',
  meublé: 'Non meublé',
  surface: '37',
  pièces: '2',
  description:
  '2 pièces au 4B av de la 1ère DB dans maison bourgeoise entourée d\'espaces verts, calme, entièrement équipé :
cuisine plaque induction, four, hotte, frigo-congélateur ;
salle de bains avec meuble vasque, douche ; revêtement sol carrelage & parquet
parking privé. Proche de la gare, arrêt bus à 200 m.
Loyer 440 € avance sur charges 30 €
rendez-vous par téléphone de préférence au 0389484153 ou 0607734024',
  loyer_mensuel: 470,
  adresse: 'Avenue de la 1re Division Blindée, Mulhouse',
  ville: 'Mulhouse',
  téléphone: '0389484153',
  statut: "active",
  price_cents: 37500,
  user_id: User.where("email = ? ", "shiwenly@gmail.com")[0].id
)

annonce.remote_photo_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571125101/r9dqqlitahhxcx522oy1.jpg"
annonce.remote_photo1_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571125104/invg0vtv9qnyxy7univ5.jpg"
annonce.remote_photo2_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571125105/qbc5t730lmxtyv1oiiqv.jpg"
annonce.save!

# 22
annonce = Annonce.create!(
  titre_annonce: 'F4 duplex',
  type_de_bien: 'Appartement',
  meublé: 'Non meublé',
  surface: '100',
  pièces: '4',
  description:
  'Spacieux f4 d\'environ 100m2 en duplex au coeur du vignoble Alsacien.
  Au premier étage, un vaste séjour et une cuisine non équipée.
  A l\'étage, 3 pièces une salle d\'eau et un wc séparé.
  Une cave complète ce descriptif. Le chauffage est électrique.
  Un parking public à 100m.',
  loyer_mensuel: 650,
  adresse: 'Saint-Hippolyte, Grand-Est, France',
  ville: 'Saint-Hippolyte',
  téléphone: '0688505614',
  statut: "active",
  price_cents: 37500,
  user_id: User.where("email = ? ", "shiwenly@gmail.com")[0].id
)

annonce.remote_photo_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571125229/yv2ubittoyr1dkinpwet.jpg"
annonce.remote_photo1_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571125233/wbnjagptrm9lnp33j9b7.jpg"
annonce.remote_photo2_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571125238/k23zpocbqiyb6gkpgvyq.jpg"
annonce.save!

# 23
annonce = Annonce.create!(
  titre_annonce: 'Grand 2 pièces 70m² avec jardin',
  type_de_bien: 'Appartement',
  meublé: 'Non meublé',
  surface: '70',
  pièces: '2',
  description:
  'Grand 2 pièces de 70 m² état neuf, non meublé, dans maison individuelle.
Équipé d\'une cheminée dans le séjour, sol en marbre, jardin privatif et débarras.
Cuisine semi-équipée (nombreux placards, plaques de cuisson et hotte aspirante).
Salle de bain avec grande douche et WC.

Fenêtres double vitrage.
Chauffage collectif au gaz (compris dans les charges)

Option garage fermé.

Quartier calme et proche commerces.
A 10 minutes en voiture de la gare de Colmar.

Disponibilité : Libre fin d\'année (entrée possible plus tôt, à discuter)
Prix : 630 € + 120 charges
Caution : 1 mois de loyer (soit 630 €)

Recherche locataires sérieux et calmes. Pas de frais d\'agence.
Agence et démarcheurs s\'abstenir svp.

Contacter de préférence directement par téléphone au 06.20.36.76.85.',
  loyer_mensuel: 650,
  adresse: 'Wintzenheim, Grand-Est, France',
  ville: 'Wintzenheim',
  téléphone: '0688505614',
  statut: "active",
  price_cents: 37500,
  user_id: User.where("email = ? ", "shiwenly@gmail.com")[0].id
)

annonce.remote_photo_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571125281/jkgnhzdm8e1xxac280g2.jpg"
annonce.remote_photo1_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571125288/trujqgrxncz8qa5qr6hq.jpg"
annonce.remote_photo2_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571125292/kpq49bv639hkhqhelgug.jpg"
annonce.save!

# 24
annonce = Annonce.create!(
  titre_annonce: 'Grande maison 160m²',
  type_de_bien: 'Appartement',
  meublé: 'Non meublé',
  surface: '160',
  pièces: '7',
  description:
  'à 5 min de Ferrette...
grande maison lumineuse de 160 m² avec grange attenante, 3 garages et un grand espace vert (env.12 ares).
RDC: cuisine équipée, salon et salle à manger, salle d\'eau et WC.
1er étage: 4 grandes chambres et une salle de bain
Grands combles aménageables.
Chauffage au fioul ou bois
DPE: D',
  loyer_mensuel: 1150,
  adresse: 'Kœstlach, Grand-Est, France',
  ville: 'Kœstlach',
  téléphone: '0768415151',
  statut: "active",
  price_cents: 37500,
  user_id: User.where("email = ? ", "shiwenly@gmail.com")[0].id
)

annonce.remote_photo_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571125330/zsnnuvhcd2l0fubxjl1b.jpg"
annonce.remote_photo1_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571125332/yezudylowvgayejkviox.jpg"
annonce.remote_photo2_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1571125334/toa6p70tjyzox7adcyqs.jpg"
annonce.save!
