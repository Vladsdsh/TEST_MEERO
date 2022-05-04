SELECT
-- pour obtenir le taux des colonnes avec des valeurs null dans la table shooting, j'ai calculé le valeur null de chaque colonne individuellement 
-- ensuite que divise par le total des champs null de la table, le résultat obtenu je le cast en chaîne de caractère pour pouvoir le concatener 
-- avec une autre chaîne de caratère et obtenir un résultat en pourcentage

  DISTINCT CONCAT(CAST ((a.taux_id/ X.y)*100 AS STRING ), " %") id_vide,
  CONCAT(CAST ((b.taux_address_id/ X.y)*100 AS STRING ), " %") address_id_vide,
  CONCAT(CAST ((c.taux_photographer_id/ X.y)*100 AS STRING ), " %") photographer_id_vide,
  CONCAT(CAST ((d.taux_status/ X.y)*100 AS STRING ), " %") status_vide,
  CONCAT(CAST ((e.taux_date_shoot/ X.y)*100 AS STRING ), " %") date_shoot_vide,
  CONCAT(CAST ((f.taux_date_creation/ X.y)*100 AS STRING ), " %") date_creation_vide
FROM (
-- cacul des valeurs null pour chaque colonne
  SELECT
    COUNT(*) AS taux_id
  FROM
    `meero-gcp-poc.test_dataset.shooting`
  WHERE
    id IS NULL ) a,
  (
  SELECT
    COUNT(*) AS taux_address_id
  FROM
    `meero-gcp-poc.test_dataset.shooting`
  WHERE
    address_id IS NULL ) b,
  (
  SELECT
    COUNT(*) AS taux_photographer_id
  FROM
    `meero-gcp-poc.test_dataset.shooting`
  WHERE
    photographer_id IS NULL ) c,
  (
  SELECT
    COUNT(*) AS taux_status
  FROM
    `meero-gcp-poc.test_dataset.shooting`
  WHERE
    status IS NULL ) d,
  (
  SELECT
    COUNT(*) AS taux_date_shoot
  FROM
    `meero-gcp-poc.test_dataset.shooting`
  WHERE
    date_shoot IS NULL ) e,
  (
  SELECT
    COUNT(*) AS taux_date_creation
  FROM
    `meero-gcp-poc.test_dataset.shooting`
  WHERE
    date_creation IS NULL ) f,
  -- cacul des valeurs null  global de la table
  (
  SELECT
    COUNT(*)y
  FROM
    `meero-gcp-poc.test_dataset.shooting` ) X