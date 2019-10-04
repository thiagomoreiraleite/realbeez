# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Candidature.delete_all
Availability.delete_all
Meeting.delete_all
Annonce.delete_all
Agent.delete_all
User.delete_all

User.create!(
  email: 'shiwenly@gmail.com',
  password: '123456',
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
  user_id: 1
)

User.create!(
  email: 'ly.somchit@gmail.com',
  password: '123456',
  civilité: 'Madame',
  nom: 'Ly',
  prénom: 'christine',
  adresse: '110 rue saint-jacques, thann',
  ville: 'Thann',
  téléphone: '0651402566'
)

User.create!(
  email: 'ly8thierry@gmail.com',
  password: '123456',
  civilité: 'Monsieur',
  nom: 'Ly',
  prénom: 'thierry',
  adresse: '75 rue patay, paris',
  ville: 'Paris',
  téléphone: '+447710168923',
  statut: 'Agent'
)

Agent.create!(
  statut: "Approuvé",
  user_id: 3
)

User.create!(
  email: 'ly8david@gmail.com',
  password: '123456',
  civilité: 'Monsieur',
  nom: 'Ly',
  prénom: 'David',
  adresse: '75 rue patay, paris',
  ville: 'Paris',
  téléphone: '+971561216797'
)

User.create!(
  email: 'immolaurent68@gmail.com',
  password: '123456',
  civilité: 'Monsieur',
  nom: 'Uhlen',
  prénom: 'Laurent',
  adresse: '10 Rue De Pfastatt, 68460 Lutterbach',
  ville: 'Lutterbach',
  téléphone: '0666774000',
  statut: 'Agent'
)

Agent.create!(
  statut: "Approuvé",
  user_id: 5
)

User.create!(
  email: 'sherleylueis@gmail.com',
  password: '123456',
  civilité: 'Madame',
  nom: 'Lueis',
  prénom: 'Sherley',
  adresse: '20, Rue du Jeu des Enfants, 67000 Strasbourg',
  ville: 'Strasbourg',
  téléphone: '0623894028'
)

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
  user_id: 1
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
  user_id: 1
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
  user_id: 2
)
annonce.remote_photo_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1569945389/unmww35wcztexqxyafk8.jpg"
annonce.remote_photo1_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1569945390/dnbc64cyg5vurgjejuym.jpg"
annonce.remote_photo2_url = "https://res.cloudinary.com/dvfwroq5k/image/upload/v1569945391/q1yguhhfegdmsus1vvax.jpg"
annonce.save!
