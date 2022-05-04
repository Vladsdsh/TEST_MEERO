-- l'on souahaite avoir le nombre de shooting pour chaque statut, il a suffit de faire un count de chaque shooting pour chaque statut en filtrant sur le statut
SELECT
  *
FROM (
  SELECT
    COUNT(*) AS looking_for_provider
  FROM
    `meero-gcp-poc.test_dataset.shooting` a1
  LEFT JOIN
    `meero-gcp-poc.test_dataset.shooting_status_group` a2
  ON
    a1.status = a2.status
  WHERE
    TRIM(a1.status) = TRIM ("looking_for_provider") ) a,
  (
  SELECT
    COUNT(*) AS travel_validation_required
  FROM
    `meero-gcp-poc.test_dataset.shooting` b1
  LEFT JOIN
    `meero-gcp-poc.test_dataset.shooting_status_group` b2
  ON
    b1.status = b2.status
  WHERE
    TRIM(b2.status) = TRIM ("travel_validation_required") ) b,
  (
  SELECT
    COUNT(*) AS canceled
  FROM
    `meero-gcp-poc.test_dataset.shooting` c1
  LEFT JOIN
    `meero-gcp-poc.test_dataset.shooting_status_group` c2
  ON
    c1.status = c2.status
  WHERE
    TRIM(c2.status) = TRIM ("canceled") ) c,
  (
  SELECT
    COUNT(*) AS ready_to_deliver
  FROM
    `meero-gcp-poc.test_dataset.shooting` d1
  LEFT JOIN
    `meero-gcp-poc.test_dataset.shooting_status_group` d2
  ON
    d1.status = d2.status
  WHERE
    TRIM(d1.status) = TRIM ("ready_to_deliver")) d,
(
  SELECT
    COUNT(*) AS delivered
  FROM
    `meero-gcp-poc.test_dataset.shooting` e1
  LEFT JOIN
    `meero-gcp-poc.test_dataset.shooting_status_group` e2
  ON
    e1.status = e2.status
  WHERE
    TRIM(e1.status) = TRIM ("delivered")) e,
(
  SELECT
    COUNT(*) AS client_selection_required
  FROM
    `meero-gcp-poc.test_dataset.shooting` f1
  LEFT JOIN
    `meero-gcp-poc.test_dataset.shooting_status_group` f2
  ON
    f1.status = f2.status
  WHERE
    TRIM(f1.status) = TRIM ("client_selection_required")) f
