-- on va dans ce cas regoupré les information venant de nos trois tables grâce à un left join 
-- afin de pouvoir avoir une donnée centralisé dans une vue.
SELECT
  B.id AS address_id,
  B.city,
  C.country_code,
  C.name AS country_name,
  A.id AS shooting_id,
  A.photographer_id,
  A.status,
  A.date_creation,
  A.date_shoot,
FROM
`meero-gcp-poc.test_dataset.shooting`A
LEFT JOIN 
  `meero-gcp-poc.test_dataset.address` B
ON
B.id = A.address_id
LEFT JOIN
`meero-gcp-poc.test_dataset.country` C
ON
C.country_code = B.country_code
WHERE status LIKE "delivered"