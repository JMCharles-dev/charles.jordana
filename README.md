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

<img width="786" height="353" alt="image" src="https://github.com/user-attachments/assets/eeb15fe7-830c-4cd0-865b-2a5bac6e3051" />

Les données permettent d'exploiter plusieurs dimensions : le temps (dates de commande), la géographie (État du client), le produit (catégorie), et le client, permettant de croiser le chiffre d'affaires selon plusieurs axes.


## Résumé 

En 2017, le chiffre d'affaires d'Olist a fortement augmenté, de par la hausse du nombre de commandes et non par le panier moyen (stable autour de 130 R$). L'année 2018 signale un ralentissement de cette croissance, donc de nouveaux leviers de croissance doivent être trouvés.

Le CA repose sur une base solide et diversifiée : environ 17 catégories sur 73 génèrent l'essentiel du chiffre d'affaires, ce qui limite le risque de dépendance à un seul produit.

Géographiquement, le CA est concentré sur São Paulo, Rio de Janeiro et le District Fédéral (SP/RJ/DF) des états avec une densité de population élevée. À l'inverse, plusieurs grands États tels que Bahia, Ceará et Pará (BA, CE, PA) ont une forte population mais Olist y est peu implanter : ils représentent donc un potentiel de croissance.

Enjeu principal : la croissance historique venant du volume de commandes, les leviers à activer sont l'acquisition de nouveaux clients notamment dans les régions à fort potentiel comme Bahia, Ceará et Pará (BA, CE, PA).

<div class='tableauPlaceholder' id='viz1787965932272' style='position: relative'><noscript><a href='#'><img alt='Analyse des ventes Olist ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;An&#47;AnalysedesventesOlist&#47;AnalysedesventesOlist&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='' /><param name='name' value='AnalysedesventesOlist&#47;AnalysedesventesOlist' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;An&#47;AnalysedesventesOlist&#47;AnalysedesventesOlist&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /><param name='language' value='fr-FR' /><param name='filter' value='publish=yes' /></object></div>                <script type='text/javascript'>                    var divElement = document.getElementById('viz1787965932272');                    var vizElement = divElement.getElementsByTagName('object')[0];                    if ( divElement.offsetWidth > 800 ) { vizElement.style.width='1200px';vizElement.style.minHeight='827px';vizElement.style.maxHeight='887px';vizElement.style.height=(divElement.offsetWidth*0.75)+'px';} else if ( divElement.offsetWidth > 500 ) { vizElement.style.width='1200px';vizElement.style.minHeight='827px';vizElement.style.maxHeight='887px';vizElement.style.height=(divElement.offsetWidth*0.75)+'px';} else { vizElement.style.width='100%';vizElement.style.height='1277px';}                     var scriptElement = document.createElement('script');                    scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';                    vizElement.parentNode.insertBefore(scriptElement, vizElement);                </script>


