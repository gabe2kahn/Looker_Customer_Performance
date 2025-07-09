
view: vintage_dqcocls {
  derived_table: {
    sql: select  a."app_cohort", 
              a."arm21_grp", 
              count(distinct a."USER_ID") as customers,
      
              count(distinct CASE WHEN p1."USER_ID"  is not null THEN p1."USER_ID"  END) as m1_ever60pdq,
              count(distinct CASE WHEN p2."USER_ID"  is not null THEN p2."USER_ID"  END) as m2_ever60pdq,
              count(distinct CASE WHEN p3."USER_ID"  is not null THEN p3."USER_ID"  END) as m3_ever60pdq,
              count(distinct CASE WHEN p4."USER_ID"  is not null THEN p4."USER_ID"  END) as m4_ever60pdq,
              count(distinct CASE WHEN p5."USER_ID"  is not null THEN p5."USER_ID"  END) as m5_ever60pdq,
              count(distinct CASE WHEN p6."USER_ID"  is not null THEN p6."USER_ID"  END) as m6_ever60pdq,
              count(distinct CASE WHEN p7."USER_ID"  is not null THEN p7."USER_ID"  END) as m7_ever60pdq,
              count(distinct CASE WHEN p8."USER_ID"  is not null THEN p8."USER_ID"  END) as m8_ever60pdq,
              count(distinct CASE WHEN p9."USER_ID"  is not null THEN p9."USER_ID"  END) as m9_ever60pdq,
              count(distinct CASE WHEN p10."USER_ID" is not null THEN p10."USER_ID" END) as m10_ever60pdq,
              count(distinct CASE WHEN p11."USER_ID" is not null THEN p11."USER_ID" END) as m11_ever60pdq,
              count(distinct CASE WHEN p12."USER_ID" is not null THEN p12."USER_ID" END) as m12_ever60pdq,
              count(distinct CASE WHEN p13."USER_ID" is not null THEN p13."USER_ID" END) as m13_ever60pdq,
              count(distinct CASE WHEN p14."USER_ID" is not null THEN p14."USER_ID" END) as m14_ever60pdq,
              count(distinct CASE WHEN p15."USER_ID" is not null THEN p15."USER_ID" END) as m15_ever60pdq,
              count(distinct CASE WHEN p16."USER_ID" is not null THEN p16."USER_ID" END) as m16_ever60pdq,
              count(distinct CASE WHEN p17."USER_ID" is not null THEN p17."USER_ID" END) as m17_ever60pdq,
              count(distinct CASE WHEN p18."USER_ID" is not null THEN p18."USER_ID" END) as m18_ever60pdq,
              count(distinct CASE WHEN p19."USER_ID" is not null THEN p19."USER_ID" END) as m19_ever60pdq,
              count(distinct CASE WHEN p20."USER_ID" is not null THEN p20."USER_ID" END) as m20_ever60pdq,
              count(distinct CASE WHEN p21."USER_ID" is not null THEN p21."USER_ID" END) as m21_ever60pdq,
              count(distinct CASE WHEN p22."USER_ID" is not null THEN p22."USER_ID" END) as m22_ever60pdq,
      
              count(distinct CASE WHEN c1."USER_ID"  is not null THEN c1."USER_ID"  END) as m1_co,
              count(distinct CASE WHEN c2."USER_ID"  is not null THEN c2."USER_ID"  END) as m2_co,
              count(distinct CASE WHEN c3."USER_ID"  is not null THEN c3."USER_ID"  END) as m3_co,
              count(distinct CASE WHEN c4."USER_ID"  is not null THEN c4."USER_ID"  END) as m4_co,
              count(distinct CASE WHEN c5."USER_ID"  is not null THEN c5."USER_ID"  END) as m5_co,
              count(distinct CASE WHEN c6."USER_ID"  is not null THEN c6."USER_ID"  END) as m6_co,
              count(distinct CASE WHEN c7."USER_ID"  is not null THEN c7."USER_ID"  END) as m7_co,
              count(distinct CASE WHEN c8."USER_ID"  is not null THEN c8."USER_ID"  END) as m8_co,
              count(distinct CASE WHEN c9."USER_ID"  is not null THEN c9."USER_ID"  END) as m9_co,
              count(distinct CASE WHEN c10."USER_ID" is not null THEN c10."USER_ID" END) as m10_co,
              count(distinct CASE WHEN c11."USER_ID" is not null THEN c11."USER_ID" END) as m11_co,
              count(distinct CASE WHEN c12."USER_ID" is not null THEN c12."USER_ID" END) as m12_co,
              count(distinct CASE WHEN c13."USER_ID" is not null THEN c13."USER_ID" END) as m13_co,
              count(distinct CASE WHEN c14."USER_ID" is not null THEN c14."USER_ID" END) as m14_co,
              count(distinct CASE WHEN c15."USER_ID" is not null THEN c15."USER_ID" END) as m15_co,
              count(distinct CASE WHEN c16."USER_ID" is not null THEN c16."USER_ID" END) as m16_co,
              count(distinct CASE WHEN c17."USER_ID" is not null THEN c17."USER_ID" END) as m17_co,
              count(distinct CASE WHEN c18."USER_ID" is not null THEN c18."USER_ID" END) as m18_co,
              count(distinct CASE WHEN c19."USER_ID" is not null THEN c19."USER_ID" END) as m19_co,
              count(distinct CASE WHEN c20."USER_ID" is not null THEN c20."USER_ID" END) as m20_co,
              count(distinct CASE WHEN c21."USER_ID" is not null THEN c21."USER_ID" END) as m21_co,
              count(distinct CASE WHEN c22."USER_ID" is not null THEN c22."USER_ID" END) as m22_co,
      
              count(distinct CASE WHEN c1."USER_ID"  is null and d1."USER_ID"  is not null THEN d1."USER_ID"  END) as m1_cls,
              count(distinct CASE WHEN c2."USER_ID"  is null and d2."USER_ID"  is not null THEN d2."USER_ID"  END) as m2_cls,
              count(distinct CASE WHEN c3."USER_ID"  is null and d3."USER_ID"  is not null THEN d3."USER_ID"  END) as m3_cls,
              count(distinct CASE WHEN c4."USER_ID"  is null and d4."USER_ID"  is not null THEN d4."USER_ID"  END) as m4_cls,
              count(distinct CASE WHEN c5."USER_ID"  is null and d5."USER_ID"  is not null THEN d5."USER_ID"  END) as m5_cls,
              count(distinct CASE WHEN c6."USER_ID"  is null and d6."USER_ID"  is not null THEN d6."USER_ID"  END) as m6_cls,
              count(distinct CASE WHEN c7."USER_ID"  is null and d7."USER_ID"  is not null THEN d7."USER_ID"  END) as m7_cls,
              count(distinct CASE WHEN c8."USER_ID"  is null and d8."USER_ID"  is not null THEN d8."USER_ID"  END) as m8_cls,
              count(distinct CASE WHEN c9."USER_ID"  is null and d9."USER_ID"  is not null THEN d9."USER_ID"  END) as m9_cls,
              count(distinct CASE WHEN c10."USER_ID" is null and d10."USER_ID" is not null THEN d10."USER_ID" END) as m10_cls,
              count(distinct CASE WHEN c11."USER_ID" is null and d11."USER_ID" is not null THEN d11."USER_ID" END) as m11_cls,
              count(distinct CASE WHEN c12."USER_ID" is null and d12."USER_ID" is not null THEN d12."USER_ID" END) as m12_cls,
              count(distinct CASE WHEN c13."USER_ID" is null and d13."USER_ID" is not null THEN d13."USER_ID" END) as m13_cls,
              count(distinct CASE WHEN c14."USER_ID" is null and d14."USER_ID" is not null THEN d14."USER_ID" END) as m14_cls,
              count(distinct CASE WHEN c15."USER_ID" is null and d15."USER_ID" is not null THEN d15."USER_ID" END) as m15_cls,
              count(distinct CASE WHEN c16."USER_ID" is null and d16."USER_ID" is not null THEN d16."USER_ID" END) as m16_cls,
              count(distinct CASE WHEN c17."USER_ID" is null and d17."USER_ID" is not null THEN d17."USER_ID" END) as m17_cls,
              count(distinct CASE WHEN c18."USER_ID" is null and d18."USER_ID" is not null THEN d18."USER_ID" END) as m18_cls,
              count(distinct CASE WHEN c19."USER_ID" is null and d19."USER_ID" is not null THEN d19."USER_ID" END) as m19_cls,
              count(distinct CASE WHEN c20."USER_ID" is null and d20."USER_ID" is not null THEN d20."USER_ID" END) as m20_cls,
              count(distinct CASE WHEN c21."USER_ID" is null and d21."USER_ID" is not null THEN d21."USER_ID" END) as m21_cls,
              count(distinct CASE WHEN c22."USER_ID" is null and d22."USER_ID" is not null THEN d22."USER_ID" END) as m22_cls,
      
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
      
                      TO_CHAR (a."APPLICATION_START_TS", 'yyyy-mm')    as "app_month",
              CASE    WHEN 0.000000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.195000 THEN 'A. Ultra Low '
                      WHEN 0.195000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.415000 THEN 'B. Low       '
                      WHEN 0.415000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.590000 THEN 'C. Medium    '
                      WHEN 0.590000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 0.730000 THEN 'D. Active R&D'
                      WHEN 0.730000 < a."ARRO_RISK_MODEL_2_1_SCORE" AND a."ARRO_RISK_MODEL_2_1_SCORE" <= 1.000000 THEN 'E. Legacy R&D'
                      ELSE                                                                                             'F. Missing ? '     
                      END AS "arm21_grp",
      
              FROM            "APPLICATION"."APPLICATION_SUMMARY" a
              INNER JOIN      "CUSTOMER"."USER_PROFILE"           b
              ON          a."USER_ID" = b."USER_ID"
              WHERE       a."TESTING_STAGE"                             = 'Rollout'
              AND         a."INCOME_DECISION"                           IS NOT NULL
              AND         a."APPLICATION_RECENCY"                       = 1) a 
      
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=1)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61) 
              group by USER_ID order by USER_ID) p1  ON      a.USER_ID = p1.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=2)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61) 
              group by USER_ID order by USER_ID) p2  ON      a.USER_ID = p2.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=3)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61) 
              group by USER_ID order by USER_ID) p3  ON      a.USER_ID = p3.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=4)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61) 
              group by USER_ID order by USER_ID) p4  ON      a.USER_ID = p4.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=5)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61) 
              group by USER_ID order by USER_ID) p5  ON      a.USER_ID = p5.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=6)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61) 
              group by USER_ID order by USER_ID) p6  ON      a.USER_ID = p6.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=7)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61) 
              group by USER_ID order by USER_ID) p7  ON      a.USER_ID = p7.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=8)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61) 
              group by USER_ID order by USER_ID) p8  ON      a.USER_ID = p8.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=9)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61) 
              group by USER_ID order by USER_ID) p9  ON      a.USER_ID = p9.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=10)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61) 
              group by USER_ID order by USER_ID) p10  ON      a.USER_ID = p10.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=11)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61) 
              group by USER_ID order by USER_ID) p11  ON      a.USER_ID = p11.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=12)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61) 
              group by USER_ID order by USER_ID) p12  ON      a.USER_ID = p12.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=13)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61) 
              group by USER_ID order by USER_ID) p13  ON      a.USER_ID = p13.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=14)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61) 
              group by USER_ID order by USER_ID) p14  ON      a.USER_ID = p14.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=15)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61) 
              group by USER_ID order by USER_ID) p15  ON      a.USER_ID = p15.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=16)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61) 
              group by USER_ID order by USER_ID) p16  ON      a.USER_ID = p16.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=17)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61) 
              group by USER_ID order by USER_ID) p17  ON      a.USER_ID = p17.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=18)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61) 
              group by USER_ID order by USER_ID) p18  ON      a.USER_ID = p18.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=19)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61) 
              group by USER_ID order by USER_ID) p19  ON      a.USER_ID = p19.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=20)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61) 
              group by USER_ID order by USER_ID) p20  ON      a.USER_ID = p20.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=21)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61) 
              group by USER_ID order by USER_ID) p21  ON      a.USER_ID = p21.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=22)
              AND     (CHARGED_OFF_ACCOUNT = 1 or days_overdue >=61) 
              group by USER_ID order by USER_ID) p22  ON      a.USER_ID = p22.USER_ID
      
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=1)
              AND     (CHARGED_OFF_ACCOUNT = 1) 
              group by USER_ID order by USER_ID) c1  ON      a.USER_ID = c1.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=2)
              AND     (CHARGED_OFF_ACCOUNT = 1) 
              group by USER_ID order by USER_ID) c2  ON      a.USER_ID = c2.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=3)
              AND     (CHARGED_OFF_ACCOUNT = 1) 
              group by USER_ID order by USER_ID) c3  ON      a.USER_ID = c3.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=4)
              AND     (CHARGED_OFF_ACCOUNT = 1) 
              group by USER_ID order by USER_ID) c4  ON      a.USER_ID = c4.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=5)
              AND     (CHARGED_OFF_ACCOUNT = 1) 
              group by USER_ID order by USER_ID) c5  ON      a.USER_ID = c5.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=6)
              AND     (CHARGED_OFF_ACCOUNT = 1) 
              group by USER_ID order by USER_ID) c6  ON      a.USER_ID = c6.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=7)
              AND     (CHARGED_OFF_ACCOUNT = 1) 
              group by USER_ID order by USER_ID) c7  ON      a.USER_ID = c7.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=8)
              AND     (CHARGED_OFF_ACCOUNT = 1) 
              group by USER_ID order by USER_ID) c8  ON      a.USER_ID = c8.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=9)
              AND     (CHARGED_OFF_ACCOUNT = 1) 
              group by USER_ID order by USER_ID) c9  ON      a.USER_ID = c9.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=10)
              AND     (CHARGED_OFF_ACCOUNT = 1) 
              group by USER_ID order by USER_ID) c10  ON      a.USER_ID = c10.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=11)
              AND     (CHARGED_OFF_ACCOUNT = 1) 
              group by USER_ID order by USER_ID) c11  ON      a.USER_ID = c11.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=12)
              AND     (CHARGED_OFF_ACCOUNT = 1) 
              group by USER_ID order by USER_ID) c12  ON      a.USER_ID = c12.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=13)
              AND     (CHARGED_OFF_ACCOUNT = 1) 
              group by USER_ID order by USER_ID) c13  ON      a.USER_ID = c13.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=14)
              AND     (CHARGED_OFF_ACCOUNT = 1) 
              group by USER_ID order by USER_ID) c14  ON      a.USER_ID = c14.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=15)
              AND     (CHARGED_OFF_ACCOUNT = 1) 
              group by USER_ID order by USER_ID) c15  ON      a.USER_ID = c15.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=16)
              AND     (CHARGED_OFF_ACCOUNT = 1) 
              group by USER_ID order by USER_ID) c16  ON      a.USER_ID = c16.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=17)
              AND     (CHARGED_OFF_ACCOUNT = 1) 
              group by USER_ID order by USER_ID) c17  ON      a.USER_ID = c17.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=18)
              AND     (CHARGED_OFF_ACCOUNT = 1) 
              group by USER_ID order by USER_ID) c18  ON      a.USER_ID = c18.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=19)
              AND     (CHARGED_OFF_ACCOUNT = 1) 
              group by USER_ID order by USER_ID) c19  ON      a.USER_ID = c19.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=20)
              AND     (CHARGED_OFF_ACCOUNT = 1) 
              group by USER_ID order by USER_ID) c20  ON      a.USER_ID = c20.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=21)
              AND     (CHARGED_OFF_ACCOUNT = 1) 
              group by USER_ID order by USER_ID) c21  ON      a.USER_ID = c21.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=22)
              AND     (CHARGED_OFF_ACCOUNT = 1) 
              group by USER_ID order by USER_ID) c22  ON      a.USER_ID = c22.USER_ID
      
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=1)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1) 
              group by USER_ID order by USER_ID) d1  ON      a.USER_ID = d1.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=2)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1) 
              group by USER_ID order by USER_ID) d2  ON      a.USER_ID = d2.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=3)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1) 
              group by USER_ID order by USER_ID) d3  ON      a.USER_ID = d3.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=4)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1) 
              group by USER_ID order by USER_ID) d4  ON      a.USER_ID = d4.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=5)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1) 
              group by USER_ID order by USER_ID) d5  ON      a.USER_ID = d5.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=6)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1) 
              group by USER_ID order by USER_ID) d6  ON      a.USER_ID = d6.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=7)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1) 
              group by USER_ID order by USER_ID) d7  ON      a.USER_ID = d7.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=8)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1) 
              group by USER_ID order by USER_ID) d8  ON      a.USER_ID = d8.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=9)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1) 
              group by USER_ID order by USER_ID) d9  ON      a.USER_ID = d9.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=10)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1) 
              group by USER_ID order by USER_ID) d10  ON      a.USER_ID = d10.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=11)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1) 
              group by USER_ID order by USER_ID) d11  ON      a.USER_ID = d11.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=12)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1) 
              group by USER_ID order by USER_ID) d12  ON      a.USER_ID = d12.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=13)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1) 
              group by USER_ID order by USER_ID) d13  ON      a.USER_ID = d13.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=14)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1) 
              group by USER_ID order by USER_ID) d14  ON      a.USER_ID = d14.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=15)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1) 
              group by USER_ID order by USER_ID) d15  ON      a.USER_ID = d15.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=16)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1) 
              group by USER_ID order by USER_ID) d16  ON      a.USER_ID = d16.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=17)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1) 
              group by USER_ID order by USER_ID) d17  ON      a.USER_ID = d17.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=18)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1) 
              group by USER_ID order by USER_ID) d18  ON      a.USER_ID = d18.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=19)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1) 
              group by USER_ID order by USER_ID) d19  ON      a.USER_ID = d19.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=20)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1) 
              group by USER_ID order by USER_ID) d20  ON      a.USER_ID = d20.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=21)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1) 
              group by USER_ID order by USER_ID) d21  ON      a.USER_ID = d21.USER_ID
      LEFT JOIN
              (SELECT USER_ID FROM "CUSTOMER"."PERFORMANCE" 
              WHERE   ( DATE_PART('month', STATEMENT_MONTH) - DATE_PART('month', ACCOUNT_OPEN_MONTH) + 
                       (DATE_PART('year', STATEMENT_MONTH) - DATE_PART('year', ACCOUNT_OPEN_MONTH)) * 12 <=22)
              AND     (CHARGED_OFF_ACCOUNT = 0 AND CLOSED_ACCOUNT=1) 
              group by USER_ID order by USER_ID) d22  ON      a.USER_ID = d22.USER_ID
      
      GROUP BY 1,2
      ORDER BY 1,2 ;;
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

  dimension: customers {
    type: number
    sql: ${TABLE}."CUSTOMERS" ;;
  }

  dimension: m1_ever60_pdq {
    type: number
    sql: ${TABLE}."M1_EVER60PDQ" ;;
  }

  dimension: m2_ever60_pdq {
    type: number
    sql: ${TABLE}."M2_EVER60PDQ" ;;
  }

  dimension: m3_ever60_pdq {
    type: number
    sql: ${TABLE}."M3_EVER60PDQ" ;;
  }

  dimension: m4_ever60_pdq {
    type: number
    sql: ${TABLE}."M4_EVER60PDQ" ;;
  }

  dimension: m5_ever60_pdq {
    type: number
    sql: ${TABLE}."M5_EVER60PDQ" ;;
  }

  dimension: m6_ever60_pdq {
    type: number
    sql: ${TABLE}."M6_EVER60PDQ" ;;
  }

  dimension: m7_ever60_pdq {
    type: number
    sql: ${TABLE}."M7_EVER60PDQ" ;;
  }

  dimension: m8_ever60_pdq {
    type: number
    sql: ${TABLE}."M8_EVER60PDQ" ;;
  }

  dimension: m9_ever60_pdq {
    type: number
    sql: ${TABLE}."M9_EVER60PDQ" ;;
  }

  dimension: m10_ever60_pdq {
    type: number
    sql: ${TABLE}."M10_EVER60PDQ" ;;
  }

  dimension: m11_ever60_pdq {
    type: number
    sql: ${TABLE}."M11_EVER60PDQ" ;;
  }

  dimension: m12_ever60_pdq {
    type: number
    sql: ${TABLE}."M12_EVER60PDQ" ;;
  }

  dimension: m13_ever60_pdq {
    type: number
    sql: ${TABLE}."M13_EVER60PDQ" ;;
  }

  dimension: m14_ever60_pdq {
    type: number
    sql: ${TABLE}."M14_EVER60PDQ" ;;
  }

  dimension: m15_ever60_pdq {
    type: number
    sql: ${TABLE}."M15_EVER60PDQ" ;;
  }

  dimension: m16_ever60_pdq {
    type: number
    sql: ${TABLE}."M16_EVER60PDQ" ;;
  }

  dimension: m17_ever60_pdq {
    type: number
    sql: ${TABLE}."M17_EVER60PDQ" ;;
  }

  dimension: m18_ever60_pdq {
    type: number
    sql: ${TABLE}."M18_EVER60PDQ" ;;
  }

  dimension: m19_ever60_pdq {
    type: number
    sql: ${TABLE}."M19_EVER60PDQ" ;;
  }

  dimension: m20_ever60_pdq {
    type: number
    sql: ${TABLE}."M20_EVER60PDQ" ;;
  }

  dimension: m21_ever60_pdq {
    type: number
    sql: ${TABLE}."M21_EVER60PDQ" ;;
  }

  dimension: m22_ever60_pdq {
    type: number
    sql: ${TABLE}."M22_EVER60PDQ" ;;
  }

  dimension: m1_co {
    type: number
    sql: ${TABLE}."M1_CO" ;;
  }

  dimension: m2_co {
    type: number
    sql: ${TABLE}."M2_CO" ;;
  }

  dimension: m3_co {
    type: number
    sql: ${TABLE}."M3_CO" ;;
  }

  dimension: m4_co {
    type: number
    sql: ${TABLE}."M4_CO" ;;
  }

  dimension: m5_co {
    type: number
    sql: ${TABLE}."M5_CO" ;;
  }

  dimension: m6_co {
    type: number
    sql: ${TABLE}."M6_CO" ;;
  }

  dimension: m7_co {
    type: number
    sql: ${TABLE}."M7_CO" ;;
  }

  dimension: m8_co {
    type: number
    sql: ${TABLE}."M8_CO" ;;
  }

  dimension: m9_co {
    type: number
    sql: ${TABLE}."M9_CO" ;;
  }

  dimension: m10_co {
    type: number
    sql: ${TABLE}."M10_CO" ;;
  }

  dimension: m11_co {
    type: number
    sql: ${TABLE}."M11_CO" ;;
  }

  dimension: m12_co {
    type: number
    sql: ${TABLE}."M12_CO" ;;
  }

  dimension: m13_co {
    type: number
    sql: ${TABLE}."M13_CO" ;;
  }

  dimension: m14_co {
    type: number
    sql: ${TABLE}."M14_CO" ;;
  }

  dimension: m15_co {
    type: number
    sql: ${TABLE}."M15_CO" ;;
  }

  dimension: m16_co {
    type: number
    sql: ${TABLE}."M16_CO" ;;
  }

  dimension: m17_co {
    type: number
    sql: ${TABLE}."M17_CO" ;;
  }

  dimension: m18_co {
    type: number
    sql: ${TABLE}."M18_CO" ;;
  }

  dimension: m19_co {
    type: number
    sql: ${TABLE}."M19_CO" ;;
  }

  dimension: m20_co {
    type: number
    sql: ${TABLE}."M20_CO" ;;
  }

  dimension: m21_co {
    type: number
    sql: ${TABLE}."M21_CO" ;;
  }

  dimension: m22_co {
    type: number
    sql: ${TABLE}."M22_CO" ;;
  }

  dimension: m1_cls {
    type: number
    sql: ${TABLE}."M1_CLS" ;;
  }

  dimension: m2_cls {
    type: number
    sql: ${TABLE}."M2_CLS" ;;
  }

  dimension: m3_cls {
    type: number
    sql: ${TABLE}."M3_CLS" ;;
  }

  dimension: m4_cls {
    type: number
    sql: ${TABLE}."M4_CLS" ;;
  }

  dimension: m5_cls {
    type: number
    sql: ${TABLE}."M5_CLS" ;;
  }

  dimension: m6_cls {
    type: number
    sql: ${TABLE}."M6_CLS" ;;
  }

  dimension: m7_cls {
    type: number
    sql: ${TABLE}."M7_CLS" ;;
  }

  dimension: m8_cls {
    type: number
    sql: ${TABLE}."M8_CLS" ;;
  }

  dimension: m9_cls {
    type: number
    sql: ${TABLE}."M9_CLS" ;;
  }

  dimension: m10_cls {
    type: number
    sql: ${TABLE}."M10_CLS" ;;
  }

  dimension: m11_cls {
    type: number
    sql: ${TABLE}."M11_CLS" ;;
  }

  dimension: m12_cls {
    type: number
    sql: ${TABLE}."M12_CLS" ;;
  }

  dimension: m13_cls {
    type: number
    sql: ${TABLE}."M13_CLS" ;;
  }

  dimension: m14_cls {
    type: number
    sql: ${TABLE}."M14_CLS" ;;
  }

  dimension: m15_cls {
    type: number
    sql: ${TABLE}."M15_CLS" ;;
  }

  dimension: m16_cls {
    type: number
    sql: ${TABLE}."M16_CLS" ;;
  }

  dimension: m17_cls {
    type: number
    sql: ${TABLE}."M17_CLS" ;;
  }

  dimension: m18_cls {
    type: number
    sql: ${TABLE}."M18_CLS" ;;
  }

  dimension: m19_cls {
    type: number
    sql: ${TABLE}."M19_CLS" ;;
  }

  dimension: m20_cls {
    type: number
    sql: ${TABLE}."M20_CLS" ;;
  }

  dimension: m21_cls {
    type: number
    sql: ${TABLE}."M21_CLS" ;;
  }

  dimension: m22_cls {
    type: number
    sql: ${TABLE}."M22_CLS" ;;
  }

  set: detail {
    fields: [
        app_cohort,
	arm21_grp,
	customers,
	m1_ever60_pdq,
	m2_ever60_pdq,
	m3_ever60_pdq,
	m4_ever60_pdq,
	m5_ever60_pdq,
	m6_ever60_pdq,
	m7_ever60_pdq,
	m8_ever60_pdq,
	m9_ever60_pdq,
	m10_ever60_pdq,
	m11_ever60_pdq,
	m12_ever60_pdq,
	m13_ever60_pdq,
	m14_ever60_pdq,
	m15_ever60_pdq,
	m16_ever60_pdq,
	m17_ever60_pdq,
	m18_ever60_pdq,
	m19_ever60_pdq,
	m20_ever60_pdq,
	m21_ever60_pdq,
	m22_ever60_pdq,
	m1_co,
	m2_co,
	m3_co,
	m4_co,
	m5_co,
	m6_co,
	m7_co,
	m8_co,
	m9_co,
	m10_co,
	m11_co,
	m12_co,
	m13_co,
	m14_co,
	m15_co,
	m16_co,
	m17_co,
	m18_co,
	m19_co,
	m20_co,
	m21_co,
	m22_co,
	m1_cls,
	m2_cls,
	m3_cls,
	m4_cls,
	m5_cls,
	m6_cls,
	m7_cls,
	m8_cls,
	m9_cls,
	m10_cls,
	m11_cls,
	m12_cls,
	m13_cls,
	m14_cls,
	m15_cls,
	m16_cls,
	m17_cls,
	m18_cls,
	m19_cls,
	m20_cls,
	m21_cls,
	m22_cls
    ]
  }
}
