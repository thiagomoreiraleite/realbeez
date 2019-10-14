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
  adresse: '110 rue saint-jacques, thann',
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
  adresse: '3 rue théodore boch, Lutterbach',
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
  adresse: '2 allée des magnolias, Thann',
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
  adresse: '2a quartier gare, 68700 Aspach-Le-Haut',
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
  adresse: '62 grand rue, 68700 Steinbach',
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
  adresse: '28 rue du 7 août, 68800 Thann',
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
  adresse: '8 parc Denise Ferrier, 68120 Pfastatt',
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
  adresse: '36a rue de Soultz, 68700 Uffholtz',
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
  adresse: '6 rue saint-jacques, 68800 Thann',
  ville: 'Thann',
  statut: 'Agent'
)

Agent.create!(
  statut: "Approuvé",
  user_id: User.where("email = ? ", "kalim.cp@gmail.com")[0].id
)

User.create!(
  email: 'christopher.bouffort@hotmail.com',
  password: '123456',
  civilité: 'Monsieur',
  nom: 'Bouffort',
  prénom: 'Christopher',
  adresse: 'Theaterstrasse, 8, 86152 Augsburg, Germany',
  ville: 'Augsburg',
  statut: 'Agent'
)

Agent.create!(
  statut: "Approuvé",
  user_id: User.where("email = ? ", "christopher.bouffort@hotmail.com")[0].id
)

User.create!(
  email: 'cedric.durighello@gmail.com',
  password: '123456',
  civilité: 'Monsieur',
  nom: 'Durighello',
  prénom: 'Cédric',
  adresse: '6 rue de Rixheim, 68390 Sausheim',
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
  adresse: '42 rue Coquillière, 75001 Paris',
  ville: 'Paris',
  statut: 'Agent'
)

Agent.create!(
  statut: "Approuvé",
  user_id: User.where("email = ? ", "ricw75@yahoo.fr")[0].id
)

User.create!(
  email: 'sylvain.bailly@yahoo.fr',
  password: '123456',
  civilité: 'Monsieur',
  nom: 'Bailly',
  prénom: 'Sylvain',
  adresse: '160 1st street, Jersey City, NJ 07302, USA',
  ville: 'Jersey City',
  statut: 'Agent'
)

Agent.create!(
  statut: "Approuvé",
  user_id: User.where("email = ? ", "sylvain.bailly@yahoo.fr")[0].id
)

User.create!(
  email: 'allison.bordes@gmail.com',
  password: '123456',
  civilité: 'Madame',
  nom: 'Bordes',
  prénom: 'Allison',
  adresse: '3 rue Brunehaut, 57000 Metz',
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
  adresse: '36 avenue Mathurin Moreau, 75019 Paris',
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
  adresse: '52 rue de l\'Amiral Mouchez, 75014 Paris',
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
  adresse: '30 boulevard de la paix, 92400 Courbevoie',
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
  adresse: '24 place du marché, 78530 Buc',
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
  adresse: '52 avenue de Choisy, 75013 Paris',
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

# =========================Annonces===========================================

annonce = Annonce.create!(
  titre_annonce: 'Charmant F3 au coeur de Riedisheim (parking disponible)',
  type_de_bien: 'Appartement',
  meublé: 'Non meublé',
  surface: '60',
  pièces: '3',
  description:
  'Appartement de type F3, au RDC (surélevé) d’un immeuble calme de 2 étages, se composant d’un séjour, d’une cuisine équipée, de 2 chambres, d’un WC et d’une salle de bain.
  Place de parking disponible dans la cour de l’immeuble.

  Disponible immédiatement, aucun frais d’agence.
  Loyer 560 euros et 50 euros de provision pour charges (garant exigé)',
  loyer_mensuel: 610,
  adresse: '5 rue de la paix, Riedisheim',
  ville: 'Riedisheim',
  email: 'shiwenly@gmail.com',
  téléphone: '0642808389',
  statut: "active",
  price_cents: 50,
  user_id: User.where("email = ? ", "shiwenly@gmail.com")[0].id
)
annonce.remote_photo_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1569945259/uygnlkuciqkafqczgrup.jpg"
annonce.remote_photo1_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1569945261/xp7so01tjnbfddnwrbyx.jpg"
annonce.remote_photo2_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1569945263/ng2llj4cmimqizcvczdn.jpg"
annonce.save!


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
  adresse: '9 rue de Carspach, Altkirch',
  ville: 'Altkirch',
  email: 'shiwenly@gmail.com',
  téléphone: '0642808389',
  statut: "active",
  price_cents: 50,
  user_id: User.where("email = ? ", "shiwenly@gmail.com")[0].id
)
annonce.remote_photo_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1569945312/ikhicfjlbmjc4atmhxr2.jpg"
annonce.remote_photo1_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1569945314/snn8cpvcodtc1imy0pdv.jpg"
annonce.remote_photo2_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1569945315/so0irqhhayu79gzbh4v2.jpg"
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
  price_cents: 50,
  user_id: User.where("email = ? ", "ly.somchit@gmail.com")[0].id
)
annonce.remote_photo_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1569945389/unmww35wcztexqxyafk8.jpg"
annonce.remote_photo1_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1569945390/dnbc64cyg5vurgjejuym.jpg"
annonce.remote_photo2_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1569945391/q1yguhhfegdmsus1vvax.jpg"
annonce.save!
