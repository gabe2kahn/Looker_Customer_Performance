
view: vintages_dqcocls {
  derived_table: {
    sql: (select  a."app_cohort", 
              a."arm21_grp", 
              1 as MOB,
              COALESCE(SUM(CASE WHEN p."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as dq_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as co_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is null and d."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as cls_rate
      FROM 
              (SELECT
                  a."USER_ID",
                  CASE    WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-05','2023-06','2023-07') THEN 'A. May23-Jul23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-08','2023-09','2023-10') THEN 'B. Aug23-Oct23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-11','2023-12','2024-01') THEN 'C. Nov23-Jan24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-02','2024-03','2024-04') THEN 'D. Feb24-Apr24' 
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-05','2024-06','2024-07') THEN 'E. May24-Jul24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-08','2024-09','2024-10') THEN 'F. Aug24-Oct24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-11','2024-12','2025-01') THEN 'G. Nov24-Jan25'
                          ELSE                                                                                       'H. Too New    ' END AS "app_cohort",
                  CASE    WHEN 0.000000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.195000 THEN 'A. Ultra Low '
                          WHEN 0.195000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.415000 THEN 'B. Low       '
                          WHEN 0.415000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.590000 THEN 'C. Medium    '
                          WHEN 0.590000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.730000 THEN 'D. Active R&D'
                          WHEN 0.730000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 1.000000 THEN 'E. Legacy R&D'
                          ELSE                                                                                             'F. Missing ? ' END AS "arm21_grp",
              FROM        "APPLICATION"."APPLICATION_SUMMARY" a
              INNER JOIN  "CUSTOMER"."USER_PROFILE"           b   ON          a."USER_ID" = b."USER_ID"
              WHERE       a."TESTING_STAGE"         = 'Rollout'   AND         a."APPLICATION_RECENCY"                       = 1) a 
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=1)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61)  group by USER_ID order by USER_ID) p  ON      a.USER_ID = p.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=1)
              AND     (CHARGED_OFF_ACCOUNT = 1)                       group by USER_ID order by USER_ID) c  ON      a.USER_ID = c.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=1)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1)  group by USER_ID order by USER_ID) d  ON      a.USER_ID = d.USER_ID
      GROUP BY 1,2,3 ORDER BY 1,2,3)
      
      UNION
      
      (select  a."app_cohort", 
              a."arm21_grp", 
              2 as MOB,
              COALESCE(SUM(CASE WHEN p."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as dq_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as co_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is null and d."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as cls_rate,
      FROM 
              (SELECT
                  a."USER_ID",
                  CASE    WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-05','2023-06','2023-07') THEN 'A. May23-Jul23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-08','2023-09','2023-10') THEN 'B. Aug23-Oct23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-11','2023-12','2024-01') THEN 'C. Nov23-Jan24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-02','2024-03','2024-04') THEN 'D. Feb24-Apr24' 
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-05','2024-06','2024-07') THEN 'E. May24-Jul24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-08','2024-09','2024-10') THEN 'F. Aug24-Oct24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-11','2024-12','2025-01') THEN 'G. Nov24-Jan25'
                          ELSE                                                                                       'H. Too New    ' END AS "app_cohort",
                  CASE    WHEN 0.000000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.195000 THEN 'A. Ultra Low '
                          WHEN 0.195000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.415000 THEN 'B. Low       '
                          WHEN 0.415000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.590000 THEN 'C. Medium    '
                          WHEN 0.590000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.730000 THEN 'D. Active R&D'
                          WHEN 0.730000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 1.000000 THEN 'E. Legacy R&D'
                          ELSE                                                                                             'F. Missing ? ' END AS "arm21_grp",
              FROM        "APPLICATION"."APPLICATION_SUMMARY" a
              INNER JOIN  "CUSTOMER"."USER_PROFILE"           b   ON          a."USER_ID" = b."USER_ID"
              WHERE       a."TESTING_STAGE"         = 'Rollout'   AND         a."APPLICATION_RECENCY"                       = 1) a 
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=2)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61)  group by USER_ID order by USER_ID) p  ON      a.USER_ID = p.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=2)
              AND     (CHARGED_OFF_ACCOUNT = 1)                       group by USER_ID order by USER_ID) c  ON      a.USER_ID = c.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=2)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1)  group by USER_ID order by USER_ID) d  ON      a.USER_ID = d.USER_ID
      GROUP BY 1,2,3 ORDER BY 1,2,3)
      
      UNION
      
      (select  a."app_cohort", 
              a."arm21_grp", 
              3 as MOB,
              COALESCE(SUM(CASE WHEN p."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as dq_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as co_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is null and d."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as cls_rate,
      FROM 
              (SELECT
                  a."USER_ID",
                  CASE    WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-05','2023-06','2023-07') THEN 'A. May23-Jul23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-08','2023-09','2023-10') THEN 'B. Aug23-Oct23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-11','2023-12','2024-01') THEN 'C. Nov23-Jan24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-02','2024-03','2024-04') THEN 'D. Feb24-Apr24' 
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-05','2024-06','2024-07') THEN 'E. May24-Jul24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-08','2024-09','2024-10') THEN 'F. Aug24-Oct24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-11','2024-12','2025-01') THEN 'G. Nov24-Jan25'
                          ELSE                                                                                       'H. Too New    ' END AS "app_cohort",
                  CASE    WHEN 0.000000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.195000 THEN 'A. Ultra Low '
                          WHEN 0.195000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.415000 THEN 'B. Low       '
                          WHEN 0.415000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.590000 THEN 'C. Medium    '
                          WHEN 0.590000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.730000 THEN 'D. Active R&D'
                          WHEN 0.730000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 1.000000 THEN 'E. Legacy R&D'
                          ELSE                                                                                             'F. Missing ? ' END AS "arm21_grp",
              FROM        "APPLICATION"."APPLICATION_SUMMARY" a
              INNER JOIN  "CUSTOMER"."USER_PROFILE"           b   ON          a."USER_ID" = b."USER_ID"
              WHERE       a."TESTING_STAGE"         = 'Rollout'   AND         a."APPLICATION_RECENCY"                       = 1) a 
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=3)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61)  group by USER_ID order by USER_ID) p  ON      a.USER_ID = p.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=3)
              AND     (CHARGED_OFF_ACCOUNT = 1)                       group by USER_ID order by USER_ID) c  ON      a.USER_ID = c.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=3)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1)  group by USER_ID order by USER_ID) d  ON      a.USER_ID = d.USER_ID
      GROUP BY 1,2,3 ORDER BY 1,2,3)
      
      UNION
      
      (select  a."app_cohort", 
              a."arm21_grp", 
              4 as MOB,
              COALESCE(SUM(CASE WHEN p."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as dq_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as co_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is null and d."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as cls_rate,
      FROM 
              (SELECT
                  a."USER_ID",
                  CASE    WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-05','2023-06','2023-07') THEN 'A. May23-Jul23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-08','2023-09','2023-10') THEN 'B. Aug23-Oct23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-11','2023-12','2024-01') THEN 'C. Nov23-Jan24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-02','2024-03','2024-04') THEN 'D. Feb24-Apr24' 
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-05','2024-06','2024-07') THEN 'E. May24-Jul24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-08','2024-09','2024-10') THEN 'F. Aug24-Oct24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-11','2024-12','2025-01') THEN 'G. Nov24-Jan25'
                          ELSE                                                                                       'H. Too New    ' END AS "app_cohort",
                  CASE    WHEN 0.000000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.195000 THEN 'A. Ultra Low '
                          WHEN 0.195000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.415000 THEN 'B. Low       '
                          WHEN 0.415000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.590000 THEN 'C. Medium    '
                          WHEN 0.590000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.730000 THEN 'D. Active R&D'
                          WHEN 0.730000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 1.000000 THEN 'E. Legacy R&D'
                          ELSE                                                                                             'F. Missing ? ' END AS "arm21_grp",
              FROM        "APPLICATION"."APPLICATION_SUMMARY" a
              INNER JOIN  "CUSTOMER"."USER_PROFILE"           b   ON          a."USER_ID" = b."USER_ID"
              WHERE       a."TESTING_STAGE"         = 'Rollout'   AND         a."APPLICATION_RECENCY"                       = 1) a 
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=4)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61)  group by USER_ID order by USER_ID) p  ON      a.USER_ID = p.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) +
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=4)
              AND     (CHARGED_OFF_ACCOUNT = 1)                       group by USER_ID order by USER_ID) c  ON      a.USER_ID = c.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=4)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1)  group by USER_ID order by USER_ID) d  ON      a.USER_ID = d.USER_ID
      GROUP BY 1,2,3 ORDER BY 1,2,3)
      
      UNION
      
      (select  a."app_cohort", 
              a."arm21_grp", 
              5 as MOB,
              COALESCE(SUM(CASE WHEN p."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as dq_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as co_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is null and d."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as cls_rate,
      FROM 
              (SELECT
                  a."USER_ID",
                  CASE    WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-05','2023-06','2023-07') THEN 'A. May23-Jul23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-08','2023-09','2023-10') THEN 'B. Aug23-Oct23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-11','2023-12','2024-01') THEN 'C. Nov23-Jan24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-02','2024-03','2024-04') THEN 'D. Feb24-Apr24' 
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-05','2024-06','2024-07') THEN 'E. May24-Jul24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-08','2024-09','2024-10') THEN 'F. Aug24-Oct24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-11','2024-12','2025-01') THEN 'G. Nov24-Jan25'
                          ELSE                                                                                       'H. Too New    ' END AS "app_cohort",
                  CASE    WHEN 0.000000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.195000 THEN 'A. Ultra Low '
                          WHEN 0.195000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.415000 THEN 'B. Low       '
                          WHEN 0.415000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.590000 THEN 'C. Medium    '
                          WHEN 0.590000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.730000 THEN 'D. Active R&D'
                          WHEN 0.730000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 1.000000 THEN 'E. Legacy R&D'
                          ELSE                                                                                             'F. Missing ? ' END AS "arm21_grp",
              FROM        "APPLICATION"."APPLICATION_SUMMARY" a
              INNER JOIN  "CUSTOMER"."USER_PROFILE"           b   ON          a."USER_ID" = b."USER_ID"
              WHERE       a."TESTING_STAGE"         = 'Rollout'   AND         a."APPLICATION_RECENCY"                       = 1) a 
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=5)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61)  group by USER_ID order by USER_ID) p  ON      a.USER_ID = p.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=5)
              AND     (CHARGED_OFF_ACCOUNT = 1)                       group by USER_ID order by USER_ID) c  ON      a.USER_ID = c.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) +
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=5)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1)  group by USER_ID order by USER_ID) d  ON      a.USER_ID = d.USER_ID
      GROUP BY 1,2,3 ORDER BY 1,2,3)
      
      UNION
      
      (select  a."app_cohort", 
              a."arm21_grp", 
              6 as MOB,
              COALESCE(SUM(CASE WHEN p."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as dq_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as co_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is null and d."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as cls_rate,
      FROM 
              (SELECT
                  a."USER_ID",
                  CASE    WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-05','2023-06','2023-07') THEN 'A. May23-Jul23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-08','2023-09','2023-10') THEN 'B. Aug23-Oct23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-11','2023-12','2024-01') THEN 'C. Nov23-Jan24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-02','2024-03','2024-04') THEN 'D. Feb24-Apr24' 
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-05','2024-06','2024-07') THEN 'E. May24-Jul24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-08','2024-09','2024-10') THEN 'F. Aug24-Oct24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-11','2024-12','2025-01') THEN 'G. Nov24-Jan25'
                          ELSE                                                                                       'H. Too New    ' END AS "app_cohort",
                  CASE    WHEN 0.000000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.195000 THEN 'A. Ultra Low '
                          WHEN 0.195000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.415000 THEN 'B. Low       '
                          WHEN 0.415000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.590000 THEN 'C. Medium    '
                          WHEN 0.590000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.730000 THEN 'D. Active R&D'
                          WHEN 0.730000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 1.000000 THEN 'E. Legacy R&D'
                          ELSE                                                                                             'F. Missing ? ' END AS "arm21_grp",
              FROM        "APPLICATION"."APPLICATION_SUMMARY" a
              INNER JOIN  "CUSTOMER"."USER_PROFILE"           b   ON          a."USER_ID" = b."USER_ID"
              WHERE       a."TESTING_STAGE"         = 'Rollout'   AND         a."APPLICATION_RECENCY"                       = 1) a 
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=6)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61)  group by USER_ID order by USER_ID) p  ON      a.USER_ID = p.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=6)
              AND     (CHARGED_OFF_ACCOUNT = 1)                       group by USER_ID order by USER_ID) c  ON      a.USER_ID = c.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=6)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1)  group by USER_ID order by USER_ID) d  ON      a.USER_ID = d.USER_ID
      GROUP BY 1,2,3 ORDER BY 1,2,3)
      
      UNION
      
      (select  a."app_cohort", 
              a."arm21_grp", 
              7 as MOB,
              COALESCE(SUM(CASE WHEN p."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as dq_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as co_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is null and d."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as cls_rate,
      FROM 
              (SELECT
                  a."USER_ID",
                  CASE    WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-05','2023-06','2023-07') THEN 'A. May23-Jul23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-08','2023-09','2023-10') THEN 'B. Aug23-Oct23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-11','2023-12','2024-01') THEN 'C. Nov23-Jan24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-02','2024-03','2024-04') THEN 'D. Feb24-Apr24' 
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-05','2024-06','2024-07') THEN 'E. May24-Jul24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-08','2024-09','2024-10') THEN 'F. Aug24-Oct24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-11','2024-12','2025-01') THEN 'G. Nov24-Jan25'
                          ELSE                                                                                       'H. Too New    ' END AS "app_cohort",
                  CASE    WHEN 0.000000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.195000 THEN 'A. Ultra Low '
                          WHEN 0.195000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.415000 THEN 'B. Low       '
                          WHEN 0.415000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.590000 THEN 'C. Medium    '
                          WHEN 0.590000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.730000 THEN 'D. Active R&D'
                          WHEN 0.730000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 1.000000 THEN 'E. Legacy R&D'
                          ELSE                                                                                             'F. Missing ? ' END AS "arm21_grp",
              FROM        "APPLICATION"."APPLICATION_SUMMARY" a
              INNER JOIN  "CUSTOMER"."USER_PROFILE"           b   ON          a."USER_ID" = b."USER_ID"
              WHERE       a."TESTING_STAGE"         = 'Rollout'   AND         a."APPLICATION_RECENCY"                       = 1) a 
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=7)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61)  group by USER_ID order by USER_ID) p  ON      a.USER_ID = p.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=7)
              AND     (CHARGED_OFF_ACCOUNT = 1)                       group by USER_ID order by USER_ID) c  ON      a.USER_ID = c.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) +
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=7)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1)  group by USER_ID order by USER_ID) d  ON      a.USER_ID = d.USER_ID
      GROUP BY 1,2,3 ORDER BY 1,2,3)
      
      UNION
      
      (select  a."app_cohort", 
              a."arm21_grp", 
              8 as MOB,
              COALESCE(SUM(CASE WHEN p."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as dq_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as co_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is null and d."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as cls_rate,
      FROM 
              (SELECT
                  a."USER_ID",
                  CASE    WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-05','2023-06','2023-07') THEN 'A. May23-Jul23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-08','2023-09','2023-10') THEN 'B. Aug23-Oct23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-11','2023-12','2024-01') THEN 'C. Nov23-Jan24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-02','2024-03','2024-04') THEN 'D. Feb24-Apr24' 
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-05','2024-06','2024-07') THEN 'E. May24-Jul24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-08','2024-09','2024-10') THEN 'F. Aug24-Oct24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-11','2024-12','2025-01') THEN 'G. Nov24-Jan25'
                          ELSE                                                                                       'H. Too New    ' END AS "app_cohort",
                  CASE    WHEN 0.000000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.195000 THEN 'A. Ultra Low '
                          WHEN 0.195000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.415000 THEN 'B. Low       '
                          WHEN 0.415000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.590000 THEN 'C. Medium    '
                          WHEN 0.590000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.730000 THEN 'D. Active R&D'
                          WHEN 0.730000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 1.000000 THEN 'E. Legacy R&D'
                          ELSE                                                                                             'F. Missing ? ' END AS "arm21_grp",
              FROM        "APPLICATION"."APPLICATION_SUMMARY" a
              INNER JOIN  "CUSTOMER"."USER_PROFILE"           b   ON          a."USER_ID" = b."USER_ID"
              WHERE       a."TESTING_STAGE"         = 'Rollout'   AND         a."APPLICATION_RECENCY"                       = 1) a 
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=8)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61)  group by USER_ID order by USER_ID) p  ON      a.USER_ID = p.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=8)
              AND     (CHARGED_OFF_ACCOUNT = 1)                       group by USER_ID order by USER_ID) c  ON      a.USER_ID = c.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=8)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1)  group by USER_ID order by USER_ID) d  ON      a.USER_ID = d.USER_ID
      GROUP BY 1,2,3 ORDER BY 1,2,3)
      
      UNION
      
      (select  a."app_cohort", 
              a."arm21_grp", 
              9 as MOB,
              COALESCE(SUM(CASE WHEN p."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as dq_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as co_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is null and d."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as cls_rate,
      FROM 
              (SELECT
                  a."USER_ID",
                  CASE    WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-05','2023-06','2023-07') THEN 'A. May23-Jul23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-08','2023-09','2023-10') THEN 'B. Aug23-Oct23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-11','2023-12','2024-01') THEN 'C. Nov23-Jan24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-02','2024-03','2024-04') THEN 'D. Feb24-Apr24' 
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-05','2024-06','2024-07') THEN 'E. May24-Jul24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-08','2024-09','2024-10') THEN 'F. Aug24-Oct24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-11','2024-12','2025-01') THEN 'G. Nov24-Jan25'
                          ELSE                                                                                       'H. Too New    ' END AS "app_cohort",
                  CASE    WHEN 0.000000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.195000 THEN 'A. Ultra Low '
                          WHEN 0.195000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.415000 THEN 'B. Low       '
                          WHEN 0.415000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.590000 THEN 'C. Medium    '
                          WHEN 0.590000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.730000 THEN 'D. Active R&D'
                          WHEN 0.730000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 1.000000 THEN 'E. Legacy R&D'
                          ELSE                                                                                             'F. Missing ? ' END AS "arm21_grp",
              FROM        "APPLICATION"."APPLICATION_SUMMARY" a
              INNER JOIN  "CUSTOMER"."USER_PROFILE"           b   ON          a."USER_ID" = b."USER_ID"
              WHERE       a."TESTING_STAGE"         = 'Rollout'   AND         a."APPLICATION_RECENCY"                       = 1) a 
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=9)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61)  group by USER_ID order by USER_ID) p  ON      a.USER_ID = p.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=9)
              AND     (CHARGED_OFF_ACCOUNT = 1)                       group by USER_ID order by USER_ID) c  ON      a.USER_ID = c.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=9)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1)  group by USER_ID order by USER_ID) d  ON      a.USER_ID = d.USER_ID
      GROUP BY 1,2,3 ORDER BY 1,2,3)
      
      UNION
      
      (select  a."app_cohort", 
              a."arm21_grp", 
              10 as MOB,
              COALESCE(SUM(CASE WHEN p."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as dq_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as co_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is null and d."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as cls_rate,
      FROM 
              (SELECT
                  a."USER_ID",
                  CASE    WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-05','2023-06','2023-07') THEN 'A. May23-Jul23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-08','2023-09','2023-10') THEN 'B. Aug23-Oct23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-11','2023-12','2024-01') THEN 'C. Nov23-Jan24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-02','2024-03','2024-04') THEN 'D. Feb24-Apr24' 
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-05','2024-06','2024-07') THEN 'E. May24-Jul24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-08','2024-09','2024-10') THEN 'F. Aug24-Oct24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-11','2024-12','2025-01') THEN 'G. Nov24-Jan25'
                          ELSE                                                                                       'H. Too New    ' END AS "app_cohort",
                  CASE    WHEN 0.000000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.195000 THEN 'A. Ultra Low '
                          WHEN 0.195000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.415000 THEN 'B. Low       '
                          WHEN 0.415000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.590000 THEN 'C. Medium    '
                          WHEN 0.590000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.730000 THEN 'D. Active R&D'
                          WHEN 0.730000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 1.000000 THEN 'E. Legacy R&D'
                          ELSE                                                                                             'F. Missing ? ' END AS "arm21_grp",
              FROM        "APPLICATION"."APPLICATION_SUMMARY" a
              INNER JOIN  "CUSTOMER"."USER_PROFILE"           b   ON          a."USER_ID" = b."USER_ID"
              WHERE       a."TESTING_STAGE"         = 'Rollout'   AND         a."APPLICATION_RECENCY"                       = 1) a 
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=10)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61)  group by USER_ID order by USER_ID) p  ON      a.USER_ID = p.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=10)
              AND     (CHARGED_OFF_ACCOUNT = 1)                       group by USER_ID order by USER_ID) c  ON      a.USER_ID = c.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=10)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1)  group by USER_ID order by USER_ID) d  ON      a.USER_ID = d.USER_ID
      GROUP BY 1,2,3 ORDER BY 1,2,3)
      
      UNION
      
      (select  a."app_cohort", 
              a."arm21_grp", 
              11 as MOB,
              COALESCE(SUM(CASE WHEN p."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as dq_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as co_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is null and d."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as cls_rate,
      FROM 
              (SELECT
                  a."USER_ID",
                  CASE    WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-05','2023-06','2023-07') THEN 'A. May23-Jul23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-08','2023-09','2023-10') THEN 'B. Aug23-Oct23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-11','2023-12','2024-01') THEN 'C. Nov23-Jan24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-02','2024-03','2024-04') THEN 'D. Feb24-Apr24' 
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-05','2024-06','2024-07') THEN 'E. May24-Jul24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-08','2024-09','2024-10') THEN 'F. Aug24-Oct24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-11','2024-12','2025-01') THEN 'G. Nov24-Jan25'
                          ELSE                                                                                       'H. Too New    ' END AS "app_cohort",
                  CASE    WHEN 0.000000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.195000 THEN 'A. Ultra Low '
                          WHEN 0.195000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.415000 THEN 'B. Low       '
                          WHEN 0.415000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.590000 THEN 'C. Medium    '
                          WHEN 0.590000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.730000 THEN 'D. Active R&D'
                          WHEN 0.730000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 1.000000 THEN 'E. Legacy R&D'
                          ELSE                                                                                             'F. Missing ? ' END AS "arm21_grp",
              FROM        "APPLICATION"."APPLICATION_SUMMARY" a
              INNER JOIN  "CUSTOMER"."USER_PROFILE"           b   ON          a."USER_ID" = b."USER_ID"
              WHERE       a."TESTING_STAGE"         = 'Rollout'   AND         a."APPLICATION_RECENCY"                       = 1) a 
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=11)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61)  group by USER_ID order by USER_ID) p  ON      a.USER_ID = p.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=11)
              AND     (CHARGED_OFF_ACCOUNT = 1)                       group by USER_ID order by USER_ID) c  ON      a.USER_ID = c.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=11)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1)  group by USER_ID order by USER_ID) d  ON      a.USER_ID = d.USER_ID
      GROUP BY 1,2,3 ORDER BY 1,2,3)
      
      UNION
      
      (select  a."app_cohort", 
              a."arm21_grp", 
              12 as MOB,
              COALESCE(SUM(CASE WHEN p."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as dq_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as co_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is null and d."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as cls_rate,
      FROM 
              (SELECT
                  a."USER_ID",
                  CASE    WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-05','2023-06','2023-07') THEN 'A. May23-Jul23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-08','2023-09','2023-10') THEN 'B. Aug23-Oct23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-11','2023-12','2024-01') THEN 'C. Nov23-Jan24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-02','2024-03','2024-04') THEN 'D. Feb24-Apr24' 
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-05','2024-06','2024-07') THEN 'E. May24-Jul24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-08','2024-09','2024-10') THEN 'F. Aug24-Oct24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-11','2024-12','2025-01') THEN 'G. Nov24-Jan25'
                          ELSE                                                                                       'H. Too New    ' END AS "app_cohort",
                  CASE    WHEN 0.000000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.195000 THEN 'A. Ultra Low '
                          WHEN 0.195000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.415000 THEN 'B. Low       '
                          WHEN 0.415000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.590000 THEN 'C. Medium    '
                          WHEN 0.590000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.730000 THEN 'D. Active R&D'
                          WHEN 0.730000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 1.000000 THEN 'E. Legacy R&D'
                          ELSE                                                                                             'F. Missing ? ' END AS "arm21_grp",
              FROM        "APPLICATION"."APPLICATION_SUMMARY" a
              INNER JOIN  "CUSTOMER"."USER_PROFILE"           b   ON          a."USER_ID" = b."USER_ID"
              WHERE       a."TESTING_STAGE"         = 'Rollout'   AND         a."APPLICATION_RECENCY"                       = 1) a 
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=12)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61)  group by USER_ID order by USER_ID) p  ON      a.USER_ID = p.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=12)
              AND     (CHARGED_OFF_ACCOUNT = 1)                       group by USER_ID order by USER_ID) c  ON      a.USER_ID = c.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=12)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1)  group by USER_ID order by USER_ID) d  ON      a.USER_ID = d.USER_ID
      GROUP BY 1,2,3 ORDER BY 1,2,3)
      
      UNION
      
      (select  a."app_cohort", 
              a."arm21_grp", 
              13 as MOB,
              COALESCE(SUM(CASE WHEN p."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as dq_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as co_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is null and d."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as cls_rate,
      FROM 
              (SELECT
                  a."USER_ID",
                  CASE    WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-05','2023-06','2023-07') THEN 'A. May23-Jul23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-08','2023-09','2023-10') THEN 'B. Aug23-Oct23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-11','2023-12','2024-01') THEN 'C. Nov23-Jan24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-02','2024-03','2024-04') THEN 'D. Feb24-Apr24' 
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-05','2024-06','2024-07') THEN 'E. May24-Jul24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-08','2024-09','2024-10') THEN 'F. Aug24-Oct24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-11','2024-12','2025-01') THEN 'G. Nov24-Jan25'
                          ELSE                                                                                       'H. Too New    ' END AS "app_cohort",
                  CASE    WHEN 0.000000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.195000 THEN 'A. Ultra Low '
                          WHEN 0.195000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.415000 THEN 'B. Low       '
                          WHEN 0.415000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.590000 THEN 'C. Medium    '
                          WHEN 0.590000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.730000 THEN 'D. Active R&D'
                          WHEN 0.730000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 1.000000 THEN 'E. Legacy R&D'
                          ELSE                                                                                             'F. Missing ? ' END AS "arm21_grp",
              FROM        "APPLICATION"."APPLICATION_SUMMARY" a
              INNER JOIN  "CUSTOMER"."USER_PROFILE"           b   ON          a."USER_ID" = b."USER_ID"
              WHERE       a."TESTING_STAGE"         = 'Rollout'   AND         a."APPLICATION_RECENCY"                       = 1) a 
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=13)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61)  group by USER_ID order by USER_ID) p  ON      a.USER_ID = p.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=13)
              AND     (CHARGED_OFF_ACCOUNT = 1)                       group by USER_ID order by USER_ID) c  ON      a.USER_ID = c.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=13)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1)  group by USER_ID order by USER_ID) d  ON      a.USER_ID = d.USER_ID
      GROUP BY 1,2,3 ORDER BY 1,2,3)
      
      UNION
      
      (select  a."app_cohort", 
              a."arm21_grp", 
              14 as MOB,
              COALESCE(SUM(CASE WHEN p."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as dq_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as co_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is null and d."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as cls_rate,
      FROM 
              (SELECT
                  a."USER_ID",
                  CASE    WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-05','2023-06','2023-07') THEN 'A. May23-Jul23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-08','2023-09','2023-10') THEN 'B. Aug23-Oct23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-11','2023-12','2024-01') THEN 'C. Nov23-Jan24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-02','2024-03','2024-04') THEN 'D. Feb24-Apr24' 
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-05','2024-06','2024-07') THEN 'E. May24-Jul24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-08','2024-09','2024-10') THEN 'F. Aug24-Oct24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-11','2024-12','2025-01') THEN 'G. Nov24-Jan25'
                          ELSE                                                                                       'H. Too New    ' END AS "app_cohort",
                  CASE    WHEN 0.000000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.195000 THEN 'A. Ultra Low '
                          WHEN 0.195000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.415000 THEN 'B. Low       '
                          WHEN 0.415000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.590000 THEN 'C. Medium    '
                          WHEN 0.590000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.730000 THEN 'D. Active R&D'
                          WHEN 0.730000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 1.000000 THEN 'E. Legacy R&D'
                          ELSE                                                                                             'F. Missing ? ' END AS "arm21_grp",
              FROM        "APPLICATION"."APPLICATION_SUMMARY" a
              INNER JOIN  "CUSTOMER"."USER_PROFILE"           b   ON          a."USER_ID" = b."USER_ID"
              WHERE       a."TESTING_STAGE"         = 'Rollout'   AND         a."APPLICATION_RECENCY"                       = 1) a 
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=14)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61)  group by USER_ID order by USER_ID) p  ON      a.USER_ID = p.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=14)
              AND     (CHARGED_OFF_ACCOUNT = 1)                       group by USER_ID order by USER_ID) c  ON      a.USER_ID = c.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=14)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1)  group by USER_ID order by USER_ID) d  ON      a.USER_ID = d.USER_ID
      GROUP BY 1,2,3 ORDER BY 1,2,3)
      
      UNION
      
      (select  a."app_cohort", 
              a."arm21_grp", 
              15 as MOB,
              COALESCE(SUM(CASE WHEN p."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as dq_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as co_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is null and d."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as cls_rate,
      FROM 
              (SELECT
                  a."USER_ID",
                  CASE    WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-05','2023-06','2023-07') THEN 'A. May23-Jul23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-08','2023-09','2023-10') THEN 'B. Aug23-Oct23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-11','2023-12','2024-01') THEN 'C. Nov23-Jan24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-02','2024-03','2024-04') THEN 'D. Feb24-Apr24' 
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-05','2024-06','2024-07') THEN 'E. May24-Jul24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-08','2024-09','2024-10') THEN 'F. Aug24-Oct24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-11','2024-12','2025-01') THEN 'G. Nov24-Jan25'
                          ELSE                                                                                       'H. Too New    ' END AS "app_cohort",
                  CASE    WHEN 0.000000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.195000 THEN 'A. Ultra Low '
                          WHEN 0.195000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.415000 THEN 'B. Low       '
                          WHEN 0.415000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.590000 THEN 'C. Medium    '
                          WHEN 0.590000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.730000 THEN 'D. Active R&D'
                          WHEN 0.730000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 1.000000 THEN 'E. Legacy R&D'
                          ELSE                                                                                             'F. Missing ? ' END AS "arm21_grp",
              FROM        "APPLICATION"."APPLICATION_SUMMARY" a
              INNER JOIN  "CUSTOMER"."USER_PROFILE"           b   ON          a."USER_ID" = b."USER_ID"
              WHERE       a."TESTING_STAGE"         = 'Rollout'   AND         a."APPLICATION_RECENCY"                       = 1) a 
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=15)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61)  group by USER_ID order by USER_ID) p  ON      a.USER_ID = p.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=15)
              AND     (CHARGED_OFF_ACCOUNT = 1)                       group by USER_ID order by USER_ID) c  ON      a.USER_ID = c.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=15)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1)  group by USER_ID order by USER_ID) d  ON      a.USER_ID = d.USER_ID
      GROUP BY 1,2,3 ORDER BY 1,2,3)
      
      UNION
      
      (select  a."app_cohort", 
              a."arm21_grp", 
              16 as MOB,
              COALESCE(SUM(CASE WHEN p."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as dq_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as co_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is null and d."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as cls_rate,
      FROM 
              (SELECT
                  a."USER_ID",
                  CASE    WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-05','2023-06','2023-07') THEN 'A. May23-Jul23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-08','2023-09','2023-10') THEN 'B. Aug23-Oct23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-11','2023-12','2024-01') THEN 'C. Nov23-Jan24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-02','2024-03','2024-04') THEN 'D. Feb24-Apr24' 
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-05','2024-06','2024-07') THEN 'E. May24-Jul24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-08','2024-09','2024-10') THEN 'F. Aug24-Oct24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-11','2024-12','2025-01') THEN 'G. Nov24-Jan25'
                          ELSE                                                                                       'H. Too New    ' END AS "app_cohort",
                  CASE    WHEN 0.000000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.195000 THEN 'A. Ultra Low '
                          WHEN 0.195000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.415000 THEN 'B. Low       '
                          WHEN 0.415000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.590000 THEN 'C. Medium    '
                          WHEN 0.590000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.730000 THEN 'D. Active R&D'
                          WHEN 0.730000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 1.000000 THEN 'E. Legacy R&D'
                          ELSE                                                                                             'F. Missing ? ' END AS "arm21_grp",
              FROM        "APPLICATION"."APPLICATION_SUMMARY" a
              INNER JOIN  "CUSTOMER"."USER_PROFILE"           b   ON          a."USER_ID" = b."USER_ID"
              WHERE       a."TESTING_STAGE"         = 'Rollout'   AND         a."APPLICATION_RECENCY"                       = 1) a 
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=16)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61)  group by USER_ID order by USER_ID) p  ON      a.USER_ID = p.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=16)
              AND     (CHARGED_OFF_ACCOUNT = 1)                       group by USER_ID order by USER_ID) c  ON      a.USER_ID = c.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=16)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1)  group by USER_ID order by USER_ID) d  ON      a.USER_ID = d.USER_ID
      GROUP BY 1,2,3 ORDER BY 1,2,3)
      
      UNION
      
      (select  a."app_cohort", 
              a."arm21_grp", 
              17 as MOB,
              COALESCE(SUM(CASE WHEN p."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as dq_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as co_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is null and d."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as cls_rate,
      FROM 
              (SELECT
                  a."USER_ID",
                  CASE    WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-05','2023-06','2023-07') THEN 'A. May23-Jul23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-08','2023-09','2023-10') THEN 'B. Aug23-Oct23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-11','2023-12','2024-01') THEN 'C. Nov23-Jan24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-02','2024-03','2024-04') THEN 'D. Feb24-Apr24' 
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-05','2024-06','2024-07') THEN 'E. May24-Jul24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-08','2024-09','2024-10') THEN 'F. Aug24-Oct24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-11','2024-12','2025-01') THEN 'G. Nov24-Jan25'
                          ELSE                                                                                       'H. Too New    ' END AS "app_cohort",
                  CASE    WHEN 0.000000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.195000 THEN 'A. Ultra Low '
                          WHEN 0.195000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.415000 THEN 'B. Low       '
                          WHEN 0.415000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.590000 THEN 'C. Medium    '
                          WHEN 0.590000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.730000 THEN 'D. Active R&D'
                          WHEN 0.730000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 1.000000 THEN 'E. Legacy R&D'
                          ELSE                                                                                             'F. Missing ? ' END AS "arm21_grp",
              FROM        "APPLICATION"."APPLICATION_SUMMARY" a
              INNER JOIN  "CUSTOMER"."USER_PROFILE"           b   ON          a."USER_ID" = b."USER_ID"
              WHERE       a."TESTING_STAGE"         = 'Rollout'   AND         a."APPLICATION_RECENCY"                       = 1) a 
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=17)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61)  group by USER_ID order by USER_ID) p  ON      a.USER_ID = p.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=17)
              AND     (CHARGED_OFF_ACCOUNT = 1)                       group by USER_ID order by USER_ID) c  ON      a.USER_ID = c.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=17)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1)  group by USER_ID order by USER_ID) d  ON      a.USER_ID = d.USER_ID
      GROUP BY 1,2,3 ORDER BY 1,2,3)
      
      UNION
      
      (select  a."app_cohort", 
              a."arm21_grp", 
              18 as MOB,
              COALESCE(SUM(CASE WHEN p."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as dq_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as co_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is null and d."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as cls_rate,
      FROM 
              (SELECT
                  a."USER_ID",
                  CASE    WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-05','2023-06','2023-07') THEN 'A. May23-Jul23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-08','2023-09','2023-10') THEN 'B. Aug23-Oct23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-11','2023-12','2024-01') THEN 'C. Nov23-Jan24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-02','2024-03','2024-04') THEN 'D. Feb24-Apr24' 
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-05','2024-06','2024-07') THEN 'E. May24-Jul24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-08','2024-09','2024-10') THEN 'F. Aug24-Oct24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-11','2024-12','2025-01') THEN 'G. Nov24-Jan25'
                          ELSE                                                                                       'H. Too New    ' END AS "app_cohort",
                  CASE    WHEN 0.000000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.195000 THEN 'A. Ultra Low '
                          WHEN 0.195000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.415000 THEN 'B. Low       '
                          WHEN 0.415000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.590000 THEN 'C. Medium    '
                          WHEN 0.590000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.730000 THEN 'D. Active R&D'
                          WHEN 0.730000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 1.000000 THEN 'E. Legacy R&D'
                          ELSE                                                                                             'F. Missing ? ' END AS "arm21_grp",
              FROM        "APPLICATION"."APPLICATION_SUMMARY" a
              INNER JOIN  "CUSTOMER"."USER_PROFILE"           b   ON          a."USER_ID" = b."USER_ID"
              WHERE       a."TESTING_STAGE"         = 'Rollout'   AND         a."APPLICATION_RECENCY"                       = 1) a 
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=18)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61)  group by USER_ID order by USER_ID) p  ON      a.USER_ID = p.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=18)
              AND     (CHARGED_OFF_ACCOUNT = 1)                       group by USER_ID order by USER_ID) c  ON      a.USER_ID = c.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=18)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1)  group by USER_ID order by USER_ID) d  ON      a.USER_ID = d.USER_ID
      GROUP BY 1,2,3 ORDER BY 1,2,3)
      
      UNION
      
      (select  a."app_cohort", 
              a."arm21_grp", 
              19 as MOB,
              COALESCE(SUM(CASE WHEN p."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as dq_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as co_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is null and d."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as cls_rate,
      FROM 
              (SELECT
                  a."USER_ID",
                  CASE    WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-05','2023-06','2023-07') THEN 'A. May23-Jul23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-08','2023-09','2023-10') THEN 'B. Aug23-Oct23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-11','2023-12','2024-01') THEN 'C. Nov23-Jan24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-02','2024-03','2024-04') THEN 'D. Feb24-Apr24' 
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-05','2024-06','2024-07') THEN 'E. May24-Jul24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-08','2024-09','2024-10') THEN 'F. Aug24-Oct24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-11','2024-12','2025-01') THEN 'G. Nov24-Jan25'
                          ELSE                                                                                       'H. Too New    ' END AS "app_cohort",
                  CASE    WHEN 0.000000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.195000 THEN 'A. Ultra Low '
                          WHEN 0.195000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.415000 THEN 'B. Low       '
                          WHEN 0.415000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.590000 THEN 'C. Medium    '
                          WHEN 0.590000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.730000 THEN 'D. Active R&D'
                          WHEN 0.730000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 1.000000 THEN 'E. Legacy R&D'
                          ELSE                                                                                             'F. Missing ? ' END AS "arm21_grp",
              FROM        "APPLICATION"."APPLICATION_SUMMARY" a
              INNER JOIN  "CUSTOMER"."USER_PROFILE"           b   ON          a."USER_ID" = b."USER_ID"
              WHERE       a."TESTING_STAGE"         = 'Rollout'   AND         a."APPLICATION_RECENCY"                       = 1) a 
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=19)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61)  group by USER_ID order by USER_ID) p  ON      a.USER_ID = p.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=19)
              AND     (CHARGED_OFF_ACCOUNT = 1)                       group by USER_ID order by USER_ID) c  ON      a.USER_ID = c.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=19)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1)  group by USER_ID order by USER_ID) d  ON      a.USER_ID = d.USER_ID
      GROUP BY 1,2,3 ORDER BY 1,2,3)
      
      UNION
      
      (select  a."app_cohort", 
              a."arm21_grp", 
              20 as MOB,
              COALESCE(SUM(CASE WHEN p."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as dq_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as co_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is null and d."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as cls_rate,
      FROM 
              (SELECT
                  a."USER_ID",
                  CASE    WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-05','2023-06','2023-07') THEN 'A. May23-Jul23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-08','2023-09','2023-10') THEN 'B. Aug23-Oct23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-11','2023-12','2024-01') THEN 'C. Nov23-Jan24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-02','2024-03','2024-04') THEN 'D. Feb24-Apr24' 
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-05','2024-06','2024-07') THEN 'E. May24-Jul24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-08','2024-09','2024-10') THEN 'F. Aug24-Oct24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-11','2024-12','2025-01') THEN 'G. Nov24-Jan25'
                          ELSE                                                                                       'H. Too New    ' END AS "app_cohort",
                  CASE    WHEN 0.000000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.195000 THEN 'A. Ultra Low '
                          WHEN 0.195000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.415000 THEN 'B. Low       '
                          WHEN 0.415000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.590000 THEN 'C. Medium    '
                          WHEN 0.590000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.730000 THEN 'D. Active R&D'
                          WHEN 0.730000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 1.000000 THEN 'E. Legacy R&D'
                          ELSE                                                                                             'F. Missing ? ' END AS "arm21_grp",
              FROM        "APPLICATION"."APPLICATION_SUMMARY" a
              INNER JOIN  "CUSTOMER"."USER_PROFILE"           b   ON          a."USER_ID" = b."USER_ID"
              WHERE       a."TESTING_STAGE"         = 'Rollout'   AND         a."APPLICATION_RECENCY"                       = 1) a 
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=20)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61)  group by USER_ID order by USER_ID) p  ON      a.USER_ID = p.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=20)
              AND     (CHARGED_OFF_ACCOUNT = 1)                       group by USER_ID order by USER_ID) c  ON      a.USER_ID = c.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=20)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1)  group by USER_ID order by USER_ID) d  ON      a.USER_ID = d.USER_ID
      GROUP BY 1,2,3 ORDER BY 1,2,3)
      
      UNION
      
      (select  a."app_cohort", 
              a."arm21_grp", 
              21 as MOB,
              COALESCE(SUM(CASE WHEN p."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as dq_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as co_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is null and d."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as cls_rate,
      FROM 
              (SELECT
                  a."USER_ID",
                  CASE    WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-05','2023-06','2023-07') THEN 'A. May23-Jul23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-08','2023-09','2023-10') THEN 'B. Aug23-Oct23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-11','2023-12','2024-01') THEN 'C. Nov23-Jan24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-02','2024-03','2024-04') THEN 'D. Feb24-Apr24' 
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-05','2024-06','2024-07') THEN 'E. May24-Jul24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-08','2024-09','2024-10') THEN 'F. Aug24-Oct24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-11','2024-12','2025-01') THEN 'G. Nov24-Jan25'
                          ELSE                                                                                       'H. Too New    ' END AS "app_cohort",
                  CASE    WHEN 0.000000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.195000 THEN 'A. Ultra Low '
                          WHEN 0.195000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.415000 THEN 'B. Low       '
                          WHEN 0.415000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.590000 THEN 'C. Medium    '
                          WHEN 0.590000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.730000 THEN 'D. Active R&D'
                          WHEN 0.730000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 1.000000 THEN 'E. Legacy R&D'
                          ELSE                                                                                             'F. Missing ? ' END AS "arm21_grp",
              FROM        "APPLICATION"."APPLICATION_SUMMARY" a
              INNER JOIN  "CUSTOMER"."USER_PROFILE"           b   ON          a."USER_ID" = b."USER_ID"
              WHERE       a."TESTING_STAGE"         = 'Rollout'   AND         a."APPLICATION_RECENCY"                       = 1) a 
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=21)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61)  group by USER_ID order by USER_ID) p  ON      a.USER_ID = p.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=21)
              AND     (CHARGED_OFF_ACCOUNT = 1)                       group by USER_ID order by USER_ID) c  ON      a.USER_ID = c.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=21)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1)  group by USER_ID order by USER_ID) d  ON      a.USER_ID = d.USER_ID
      GROUP BY 1,2,3 ORDER BY 1,2,3)
      
      UNION
      
      (select  a."app_cohort", 
              a."arm21_grp", 
              22 as MOB,
              COALESCE(SUM(CASE WHEN p."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as dq_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as co_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is null and d."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as cls_rate,
      FROM 
              (SELECT
                  a."USER_ID",
                  CASE    WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-05','2023-06','2023-07') THEN 'A. May23-Jul23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-08','2023-09','2023-10') THEN 'B. Aug23-Oct23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-11','2023-12','2024-01') THEN 'C. Nov23-Jan24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-02','2024-03','2024-04') THEN 'D. Feb24-Apr24' 
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-05','2024-06','2024-07') THEN 'E. May24-Jul24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-08','2024-09','2024-10') THEN 'F. Aug24-Oct24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-11','2024-12','2025-01') THEN 'G. Nov24-Jan25'
                          ELSE                                                                                       'H. Too New    ' END AS "app_cohort",
                  CASE    WHEN 0.000000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.195000 THEN 'A. Ultra Low '
                          WHEN 0.195000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.415000 THEN 'B. Low       '
                          WHEN 0.415000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.590000 THEN 'C. Medium    '
                          WHEN 0.590000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.730000 THEN 'D. Active R&D'
                          WHEN 0.730000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 1.000000 THEN 'E. Legacy R&D'
                          ELSE                                                                                             'F. Missing ? ' END AS "arm21_grp",
              FROM        "APPLICATION"."APPLICATION_SUMMARY" a
              INNER JOIN  "CUSTOMER"."USER_PROFILE"           b   ON          a."USER_ID" = b."USER_ID"
              WHERE       a."TESTING_STAGE"         = 'Rollout'   AND         a."APPLICATION_RECENCY"                       = 1) a 
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=22)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61)  group by USER_ID order by USER_ID) p  ON      a.USER_ID = p.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=22)
              AND     (CHARGED_OFF_ACCOUNT = 1)                       group by USER_ID order by USER_ID) c  ON      a.USER_ID = c.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=22)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1)  group by USER_ID order by USER_ID) d  ON      a.USER_ID = d.USER_ID
      GROUP BY 1,2,3 ORDER BY 1,2,3)
      
      UNION
      
      (select  a."app_cohort", 
              a."arm21_grp", 
              23 as MOB,
              COALESCE(SUM(CASE WHEN p."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as dq_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as co_rate,
              COALESCE(SUM(CASE WHEN c."USER_ID" is null and d."USER_ID" is not null THEN 1 ELSE 0 END),0)/count(distinct a."USER_ID") as cls_rate,
      FROM 
              (SELECT
                  a."USER_ID",
                  CASE    WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-05','2023-06','2023-07') THEN 'A. May23-Jul23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-08','2023-09','2023-10') THEN 'B. Aug23-Oct23'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2023-11','2023-12','2024-01') THEN 'C. Nov23-Jan24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-02','2024-03','2024-04') THEN 'D. Feb24-Apr24' 
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-05','2024-06','2024-07') THEN 'E. May24-Jul24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-08','2024-09','2024-10') THEN 'F. Aug24-Oct24'
                          WHEN TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm') IN ('2024-11','2024-12','2025-01') THEN 'G. Nov24-Jan25'
                          ELSE                                                                                       'H. Too New    ' END AS "app_cohort",
                  CASE    WHEN 0.000000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.195000 THEN 'A. Ultra Low '
                          WHEN 0.195000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.415000 THEN 'B. Low       '
                          WHEN 0.415000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.590000 THEN 'C. Medium    '
                          WHEN 0.590000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.730000 THEN 'D. Active R&D'
                          WHEN 0.730000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 1.000000 THEN 'E. Legacy R&D'
                          ELSE                                                                                             'F. Missing ? ' END AS "arm21_grp",
              FROM        "APPLICATION"."APPLICATION_SUMMARY" a
              INNER JOIN  "CUSTOMER"."USER_PROFILE"           b   ON          a."USER_ID" = b."USER_ID"
              WHERE       a."TESTING_STAGE"         = 'Rollout'   AND         a."APPLICATION_RECENCY"                       = 1) a 
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=23)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61)  group by USER_ID order by USER_ID) p  ON      a.USER_ID = p.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=23)
              AND     (CHARGED_OFF_ACCOUNT = 1)                       group by USER_ID order by USER_ID) c  ON      a.USER_ID = c.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=23)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1)  group by USER_ID order by USER_ID) d  ON      a.USER_ID = d.USER_ID
      GROUP BY 1,2,3 ORDER BY 1,2,3) ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: app_cohort {
    type: string
    sql: ${TABLE}."app_cohort" ;;
  }

  dimension: arm21_grp {
    type: string
    sql: ${TABLE}."arm21_grp" ;;
  }

  dimension: mob {
    type: number
    sql: ${TABLE}."MOB" ;;
  }

  dimension: dq_rate {
    type: number
    sql: ${TABLE}."DQ_RATE" ;;
  }

  dimension: co_rate {
    type: number
    sql: ${TABLE}."CO_RATE" ;;
  }

  dimension: cls_rate {
    type: number
    sql: ${TABLE}."CLS_RATE" ;;
  }

  set: detail {
    fields: [
        app_cohort,
	arm21_grp,
	mob,
	dq_rate,
	co_rate,
	cls_rate
    ]
  }
}
