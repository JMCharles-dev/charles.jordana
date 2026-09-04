-- =====================================================
-- CA par catégorie de produit
-- Revenu = price (table Items), source retenue pour le CA
-- Traduction des catégories PT -> EN via la table Translation
--   NB : table importée sans en-têtes, d'où string_field_0 (nom PT)
--        et string_field_1 (nom EN)
-- =====================================================

SELECT
  t.string_field_1                              AS categorie,
  ROUND(SUM(i.price), 2)                        AS chiffre_affaires,
  COUNT(*)                                      AS nb_articles_vendus,
  ROUND(SUM(i.price) / COUNT(*), 2)             AS prix_moyen_article
FROM `Olist.Items` AS i
LEFT JOIN `Olist.Products` AS p
  ON i.product_id = p.product_id
LEFT JOIN `Olist.Translation` AS t
  ON p.product_category_name = t.string_field_0
GROUP BY categorie
ORDER BY chiffre_affaires DESC

-- =====================================================
-- CA par mois (série temporelle)
-- Date retenue : order_purchase_timestamp (moment de l'achat,
--   plus complet et fidèle à la question commerciale que
--   approved_at ou delivered_customer_date)
-- =====================================================

SELECT
  FORMAT_DATE('%Y-%m', o.order_purchase_timestamp)  AS mois,
  ROUND(SUM(i.price), 2)                            AS chiffre_affaires,
  COUNT(DISTINCT o.order_id)                        AS nb_commande,
  ROUND(SUM(i.price) / COUNT(DISTINCT o.order_id), 2) AS prix_moyen_commande
FROM `Olist.Orders` AS o
JOIN `Olist.Items` AS i
  ON o.order_id = i.order_id
WHERE o.order_status = 'delivered'
GROUP BY mois
ORDER BY mois ASC;


-- =====================================================
-- CA par région (état du client)
-- Lien géographique via la table Customers (customer_state)
-- =====================================================

SELECT
  c.customer_state                                  AS region,
  ROUND(SUM(i.price), 2)                            AS chiffre_affaires,
  COUNT(DISTINCT o.order_id)                        AS nb_commande,
  ROUND(SUM(i.price) / COUNT(DISTINCT o.order_id), 2) AS prix_moyen_commande
FROM `Olist.Orders` AS o
JOIN `Olist.Customers` AS c
  ON o.customer_id = c.customer_id
JOIN `Olist.Items` AS i
  ON o.order_id = i.order_id
WHERE o.order_status = 'delivered'
GROUP BY region
ORDER BY chiffre_affaires DESC;


-- =====================================================
-- Catégories consommées dans les 3 états à fort CA/habitant
--   (SP, RJ, DF) : vérifie si l'assortiment diffère des
--   régions à fort potentiel (Nordeste)
-- =====================================================

SELECT
  c.customer_state                                  AS region,
  t.string_field_1                                  AS categorie,
  ROUND(SUM(i.price), 2)                            AS chiffre_affaires,
  COUNT(DISTINCT o.order_id)                        AS nb_commande,
  ROUND(SUM(i.price) / COUNT(DISTINCT o.order_id), 2) AS prix_moyen_commande
FROM `Olist.Orders` AS o
JOIN `Olist.Customers` AS c
  ON o.customer_id = c.customer_id
JOIN `Olist.Items` AS i
  ON o.order_id = i.order_id
LEFT JOIN `Olist.Products` AS p
  ON i.product_id = p.product_id
LEFT JOIN `Olist.Translation` AS t
  ON p.product_category_name = t.string_field_0
WHERE o.order_status = 'delivered'
  AND c.customer_state IN ('SP','RJ','DF')
GROUP BY region, categorie
ORDER BY chiffre_affaires DESC;

-- =====================================================
-- Catégories consommées dans les 3 états à fort potentiel
--   (BA, CE, PA) : gros états à faible CA/habitant
-- Objectif : comparer leur assortiment à celui des états
--   performants (SP, RJ, DF) pour voir si l'offre diffère
-- =====================================================

SELECT
  c.customer_state                                  AS region,
  t.string_field_1                                  AS categorie,
  ROUND(SUM(i.price), 2)                            AS chiffre_affaires,
  COUNT(DISTINCT o.order_id)                        AS nb_commande,
  ROUND(SUM(i.price) / COUNT(DISTINCT o.order_id), 2) AS prix_moyen_commande
FROM `Olist.Orders` AS o
JOIN `Olist.Customers` AS c
  ON o.customer_id = c.customer_id
JOIN `Olist.Items` AS i
  ON o.order_id = i.order_id
LEFT JOIN `Olist.Products` AS p
  ON i.product_id = p.product_id
LEFT JOIN `Olist.Translation` AS t
  ON p.product_category_name = t.string_field_0
WHERE o.order_status = 'delivered'
  AND c.customer_state IN ('BA','CE','PA')
GROUP BY region, categorie
ORDER BY chiffre_affaires DESC;

-- =====================================================
-- CA par catégorie et par mois (dynamique des catégories)
-- Objectif : suivre l'évolution de chaque catégorie dans
--   le temps pour identifier celles qui croissent ou déclinent
-- =====================================================

SELECT
  FORMAT_DATE('%Y-%m', o.order_purchase_timestamp)  AS mois,
  t.string_field_1                                  AS categorie,
  ROUND(SUM(i.price), 2)                            AS chiffre_affaires,
  COUNT(*)                                          AS nb_articles_vendus,
  ROUND(SUM(i.price) / COUNT(*), 2)                 AS prix_moyen_article
FROM `Olist.Items` AS i
JOIN `Olist.Orders` AS o
  ON i.order_id = o.order_id
LEFT JOIN `Olist.Products` AS p
  ON i.product_id = p.product_id
LEFT JOIN `Olist.Translation` AS t
  ON p.product_category_name = t.string_field_0
WHERE o.order_status = 'delivered'
GROUP BY categorie, mois
ORDER BY mois ASC;


-- =====================================================
-- CA par région et par mois (dynamique régionale)
-- Objectif : suivre l'évolution du CA de chaque État dans
--   le temps et observer la stabilité de la répartition
-- =====================================================

SELECT
  FORMAT_DATE('%Y-%m', o.order_purchase_timestamp)  AS mois,
  c.customer_state                                  AS region,
  ROUND(SUM(i.price), 2)                            AS chiffre_affaires,
  COUNT(DISTINCT o.order_id)                        AS nb_commande,
  ROUND(SUM(i.price) / COUNT(DISTINCT o.order_id), 2) AS prix_moyen_commande
FROM `Olist.Orders` AS o
JOIN `Olist.Customers` AS c
  ON o.customer_id = c.customer_id
JOIN `Olist.Items` AS i
  ON o.order_id = i.order_id
WHERE o.order_status = 'delivered'
GROUP BY region, mois
ORDER BY mois ASC;
