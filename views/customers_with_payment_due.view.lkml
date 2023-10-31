view: customers_with_payment_due {
  sql_table_name: "CUSTOMER"."CUSTOMERS_WITH_PAYMENT_DUE" ;;

  dimension_group: account_open {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."ACCOUNT_OPEN_DATE" ;;
  }
  dimension: arm1_bucket {
    type: string
    sql: ${TABLE}."ARM1_BUCKET" ;;
  }
  dimension: arro_risk_model_1_score {
    type: number
    sql: ${TABLE}."ARRO_RISK_MODEL_1_SCORE" ;;
  }
  dimension: attempted_payment_ind {
    type: string
    sql: ${TABLE}."ATTEMPTED_PAYMENT_IND" ;;
  }
  dimension: balance_bucket {
    type: string
    sql: ${TABLE}."BALANCE_BUCKET" ;;
  }
  dimension: cl_growth {
    type: number
    sql: ${TABLE}."CL_GROWTH" ;;
  }
  dimension: credit_utilization {
    type: number
    sql: ${TABLE}."CREDIT_UTILIZATION" ;;
  }
  dimension: current_credit_limit {
    type: string
    sql: ${TABLE}."CURRENT_CREDIT_LIMIT" ;;
  }
  dimension: days_overdue {
    type: number
    sql: ${TABLE}."DAYS_OVERDUE" ;;
  }
  dimension: docv_ind {
    type: string
    sql: ${TABLE}."DOCV_IND" ;;
  }
  dimension: email_ever_opened_ind {
    type: string
    sql: ${TABLE}."EMAIL_EVER_OPENED_IND" ;;
  }
  dimension: ever_overdue_ind {
    type: string
    sql: ${TABLE}."EVER_OVERDUE_IND" ;;
  }
  dimension: ever_spent_at_high_risk_mcc_ind {
    type: string
    sql: ${TABLE}."EVER_SPENT_AT_HIGH_RISK_MCC_IND" ;;
  }
  dimension: fraud_score_bucket {
    type: string
    sql: ${TABLE}."FRAUD_SCORE_BUCKET" ;;
  }
  dimension: highest_socure_fraud_risk_score {
    type: number
    sql: ${TABLE}."HIGHEST_SOCURE_FRAUD_RISK_SCORE" ;;
  }
  dimension: income_bucket {
    type: string
    sql: ${TABLE}."INCOME_BUCKET" ;;
  }
  dimension: initial_credit_limit {
    type: number
    sql: ${TABLE}."INITIAL_CREDIT_LIMIT" ;;
  }
  dimension_group: most_recent_due {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."MOST_RECENT_DUE_DATE" ;;
  }
  dimension_group: most_recent_failed_payment {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."MOST_RECENT_FAILED_PAYMENT" ;;
  }

  dimension: failed_payment_ind {
    type: string
    sql: CASE
      WHEN ${most_recent_failed_payment_date} >= DATEADD(DAYS,-14,current_date) THEN 'b. Failed in Last 2 Weeks'
      WHEN ${most_recent_failed_payment_date} >= DATEADD(MONTHS,-1,current_date) THEN 'c. Failed in Last Month'
      WHEN ${most_recent_failed_payment_date} IS NOT NULL THEN 'd. Failed Outside Last Month'
      ELSE 'a. No Failed Payments'
    END ;;
  }

  dimension: most_recent_min_pay {
    type: number
    sql: ${TABLE}."MOST_RECENT_MIN_PAY" ;;
  }
  dimension_group: most_recent_successful_payment {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."MOST_RECENT_SUCCESSFUL_PAYMENT" ;;
  }
  dimension: num_activities_completed {
    type: number
    sql: ${TABLE}."NUM_ACTIVITIES_COMPLETED" ;;
  }

  dimension: activities_completed_bucket {
    type: string
    sql: CASE
      WHEN ${num_activities_completed} = 0 THEN 'a. 0'
      WHEN ${num_activities_completed} between 1 and 2 THEN 'b. 1-2'
      WHEN ${num_activities_completed} between 3 and 7 THEN 'c. 3-7'
      WHEN ${num_activities_completed} between 8 and 14 THEN 'd. 8-14'
      WHEN ${num_activities_completed} between 15 and 20 THEN 'e. 15-20'
      WHEN ${num_activities_completed} between 15 and 20 THEN 'f. 21-30'
      WHEN ${num_activities_completed} > 30 THEN 'g. 31+'
    END
    ;;
  }

  dimension: num_attempted_payments {
    type: number
    sql: ${TABLE}."NUM_ATTEMPTED_PAYMENTS" ;;
  }
  dimension: outstanding_balance {
    type: number
    sql: ${TABLE}."OUTSTANDING_BALANCE" ;;
  }
  dimension: overdue_group {
    type: string
    sql: ${TABLE}."OVERDUE_GROUP" ;;
  }
  dimension: overdue_ind {
    type: yesno
    sql: ${TABLE}."OVERDUE_IND" ;;
  }

  dimension: statement_balance {
    type: number
    sql: ${TABLE}."STATEMENT_BALANCE" ;;
  }
  dimension: statement_balance_zero_ind {
    type: string
    sql: ${TABLE}."STATEMENT_BALANCE_ZERO_IND" ;;
  }
  dimension: sum_salary_income_txn_0_365 {
    type: number
    sql: ${TABLE}."SUM_SALARY_INCOME_TXN_0_365" ;;
  }
  dimension: user_id {
    type: string
    primary_key: yes
    sql: ${TABLE}."USER_ID" ;;
  }

  dimension: vantage_bucket {
    type: string
    sql: ${TABLE}."VANTAGE_BUCKET" ;;
  }
  dimension: vantage_score {
    type: number
    sql: ${TABLE}."VANTAGE_SCORE" ;;
  }

  measure: users {
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: overdue_users {
    type: count_distinct
    sql: CASE WHEN ${overdue_ind} = 'True' THEN ${user_id} END ;;
  }
}
