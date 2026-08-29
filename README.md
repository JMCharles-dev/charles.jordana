# charles.jordana
Analyse des ventes Olist

## Contexte & vue d'ensemble

Olist est une marketplace brésilienne qui met en relation des vendeurs et des clients à travers le brésil. L'entreprise dispose d'un dataset de 100 000 commandes effectuées entre mi-2016 et mi-2018, réparties sur 9 tables. 
Ce projet analyse ces données pour identifier les leviers de croissance du Chiffre d'Affaire afin d'ajuster les décisions commerciales.

Décision : Sur quelles catégories de produits et quelles régions concentrer les efforts pour que le chiffre d'affaires continue à croître.

Les axes analysés :

* Tendances du chiffre d'affaires dans le temps
* Performance par catégorie de produits
* Répartition géographique du CA (par État)


Lien vers le détail technique :
Requêtes SQL  [].

## Structure des données
Le jeu de données Olist est composé de 9 tables, l'analyse n'a nécessité que 6 d'entre elles. La table centrale Orders relie les commandes aux tables clients, paiements et articles. Chaque commande est associée à un ou plusieurs articles, eux-mêmes rattachés à un produit. Le client de chaque commande est localisé via son État.

<img width="1066" height="461" alt="image" src="https://github.com/user-attachments/assets/6aaae3ff-0e1d-4aef-8eb1-cb03c9c01e89" />

Les données permettent d'exploiter plusieurs dimensions : le temps (dates de commande), la géographie (État du client), le produit (catégorie), et le client, permettant de croiser le chiffre d'affaires selon plusieurs axes.


## Résumé 

Entre 2017 et 2018, le chiffre d'affaires d'Olist a fortement augmenté, du fait de la hausse du nombre de commandes et non du panier moyen (stable autour de 130 R$). L'année 2018 signale un ralentissement de cette croissance : de nouveaux leviers doivent donc être trouvés.

Le CA repose sur une base solide et diversifiée : environ 17 catégories sur 73 génèrent l'essentiel du chiffre d'affaires, ce qui limite le risque de dépendance à un seul produit.

Géographiquement, le CA est concentré sur São Paulo, Rio de Janeiro et le District Fédéral (SP/RJ/DF) des états avec une densité de population élevée. À l'inverse, plusieurs grands États tels que Bahia, Ceará et Pará (BA, CE, PA) ont une forte population mais Olist y est peu implanter : ils représentent donc un potentiel de croissance.

Enjeu principal : la croissance historique venant du volume de commandes, les leviers à activer sont l'acquisition de nouveaux clients notamment dans les régions à fort potentiel comme Bahia, Ceará et Pará (BA, CE, PA).

<img width="1194" height="861" alt="image" src="https://github.com/user-attachments/assets/652a07c0-c8ee-4821-8e18-18fd535dce4f" />


[Voir le dashboard interactif sur Tableau Public](https://public.tableau.com/views/AnalysedesventesOlist/AnalysedesventesOlist?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)



## Analyse détaillée

### 1. Tendance du chiffre d'affaires dans le temps

[insérer la courbe CA mensuel]

Le CA est passé de 112k R$ en début 2017 à environ 650k R$ fin 2017 avec un pic isolé à 988k R$ en novembre 2017, soit une forte croissance sur l'année, avant de se stabiliser autour de 826-978k R$/mois en 2018.
Cette croissance est due aux volume de commandes de 750 à 7k/mois et non au panier moyen, resté stable autour de 130 R$. La stagnation du panier moyen est un levier économique sous exploitée.

### 2. Répartition du CA par catégorie

[insérer le graphe catégories]

Le top 3 (santé/beauté, montres/cadeaux, literie/bain) dépasse [1 M R$] chacune.
Environ [17 catégories sur 73] concentrent 80% du CA → base diversifiée, peu de risque de dépendance.
Certaines catégories atteignent le CA par le volume, d'autres par la valeur (ex : informatique, panier >1000 R$ mais peu de ventes → CA plus volatil).

### 3. Répartition géographique du CA

[insérer le graphe régions]

São Paulo concentre [~40%] du CA, mais rapporté à la population, SP/RJ/DF sont au même niveau → domination démographique, pas anormale.
Les États du Nordeste (BA, CE, PA) : forte population, faible CA/habitant → potentiel inexploité.
Les catégories consommées sont [identiques] entre régions riches et Nordeste → le levier est la pénétration, pas l'offre.
