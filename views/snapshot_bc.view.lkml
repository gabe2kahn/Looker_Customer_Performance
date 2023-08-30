view: snapshot_bc {
  sql_table_name: "CUSTOMER"."SNAPSHOT_BC" ;;

  dimension_group: account_closed_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."ACCOUNT_CLOSED_TS" ;;
  }

  dimension: account_status {
    type: string
    sql: CASE
      WHEN ${zero_balance_ind} = 'Yes' THEN 'Zero Balance'
      WHEN ${overdue_ind} = 'Yes' THEN 'Overdue'
      WHEN ${minimum_payment_due} = 0 THEN 'No Balance Due'
      WHEN ${successful_payment_amount_to_due_date} >= ${minimum_payment_due} THEN 'Minimum Payment Met'
      WHEN ${pending_payment_amount_to_due_date} >= ${minimum_payment_due} THEN 'Minimum Payment Met - Pending'
      WHEN ${successful_payment_amount_to_due_date} < ${minimum_payment_due} THEN 'Minimum Payment Unmet'
    END;;
  }

  dimension: active_level {
    type: string
    sql: ${TABLE}."ACTIVE_LEVEL" ;;
  }

  dimension: autopay_on_ind {
    type: yesno
    sql: ${TABLE}."AUTOPAY_ON_IND" ;;
  }

  dimension: charged_off_reason {
    type: number
    sql: ${TABLE}."CHARGED_OFF_REASON" ;;
  }

  dimension_group: chargeoff {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."CHARGEOFF_DATE" AS TIMESTAMP_NTZ) ;;
  }

  dimension: credit_limit_growth {
    type: number
    sql: ${current_credit_limit} - ${user_profile.initial_credit_limit} ;;
  }

  dimension: credit_utilization {
    type: number
    sql: ${TABLE}."CREDIT_UTILIZATION" ;;
  }

  dimension: current_credit_limit {
    type: number
    sql: ${TABLE}."CURRENT_CREDIT_LIMIT" ;;
  }

  dimension: current_interest_rate {
    type: number
    sql: ${TABLE}."CURRENT_INTEREST_RATE" ;;
  }

  dimension: current_status {
    type: string
    sql: CASE
      WHEN ${overdue_ind} = 'TRUE' THEN 'Overdue'
      WHEN ${statements.statement_balance_zero_ind} = 'Yes' THEN 'Current - No Balance Last Statement'
      ELSE 'Current - Balance Last Statement'
    END ;;
  }

  dimension: days_overdue {
    type: number
    sql: ${TABLE}."DAYS_OVERDUE" ;;
  }

  dimension: overdue_group {
    type: string
    sql: CASE
      WHEN ${days_overdue} = 0 THEN 'a. 0'
      WHEN ${days_overdue} BETWEEN 1 AND 5 THEN 'b. 1-5'
      WHEN ${days_overdue} BETWEEN 6 AND 10 THEN 'c. 6-10'
      WHEN ${days_overdue} BETWEEN 11 AND 20 THEN 'd. 11-20'
      WHEN ${days_overdue} BETWEEN 21 AND 30 THEN 'e. 21-30'
      WHEN ${days_overdue} > 31 THEN 'f. 31+'
    END ;;
  }

  dimension: delinq_120_plus_balance {
    type: number
    sql: ${TABLE}."DELINQ_120PLUS_BALANCE" ;;
  }

  dimension: delinq_150_plus_balance {
    type: number
    sql: ${TABLE}."DELINQ_150PLUS_BALANCE" ;;
  }

  dimension: delinq_180_plus_balance {
    type: number
    sql: ${TABLE}."DELINQ_180PLUS_BALANCE" ;;
  }

  dimension: delinq_30_plus_balance {
    type: number
    sql: ${TABLE}."DELINQ_30PLUS_BALANCE" ;;
  }

  dimension: delinq_60_plus_balance {
    type: number
    sql: ${TABLE}."DELINQ_60PLUS_BALANCE" ;;
  }

  dimension: delinq_90_plus_balance {
    type: number
    sql: ${TABLE}."DELINQ_90PLUS_BALANCE" ;;
  }

  dimension: ever_overdue_ind {
    type: string
    sql: ${TABLE}."EVER_OVERDUE_IND" ;;
  }

  dimension: ever_overdue_status {
    type: string
    sql: CASE
      WHEN ${overdue_ind} = 'TRUE' THEN 'c. Overdue'
      WHEN ${ever_overdue_ind} = 'TRUE' THEN 'b. Cured'
      ELSE 'a. Never Overdue'
      END ;;
  }

  dimension: gaco {
    type: number
    sql: ${TABLE}."GACO" ;;
  }

  dimension: guco {
    type: number
    sql: ${TABLE}."GUCO" ;;
  }

  dimension: index_rate {
    type: number
    sql: ${TABLE}."INDEX_RATE" ;;
  }

  dimension: interest_accrued {
    type: number
    sql: ${TABLE}."INTEREST_ACCRUED" ;;
  }

  dimension_group: last_update_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."LAST_UPDATE_TS" ;;
  }

  dimension: loan_type_id {
    type: number
    sql: ${TABLE}."LOAN_TYPE_ID" ;;
  }

  dimension: minimum_payment_due {
    type: number
    sql: ${TABLE}."MINIMUM_PAYMENT_DUE" ;;
  }

  dimension: minimum_payment_fees_amount {
    type: number
    sql: ${TABLE}."MINIMUM_PAYMENT_FEES_AMOUNT" ;;
  }

  dimension: minimum_payment_interest_amount {
    type: number
    sql: ${TABLE}."MINIMUM_PAYMENT_INTEREST_AMOUNT" ;;
  }

  dimension: minimum_payment_late_fees_amount {
    type: number
    sql: ${TABLE}."MINIMUM_PAYMENT_LATE_FEES_AMOUNT" ;;
  }

  dimension_group: most_recent_autopay_authorization {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."MOST_RECENT_AUTOPAY_AUTHORIZATION_DATE" ;;
  }

  dimension_group: most_recent_due_date {
    type: time
    timeframes: [date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."MOST_RECENT_DUE_DATE" ;;
  }

  dimension_group: next_due_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."NEXT_DUE_DATE" ;;
  }

  dimension: outstanding_balance {
    type: number
    sql: ${TABLE}."OUTSTANDING_BALANCE" ;;
  }

  dimension: outstanding_fees {
    type: number
    sql: ${TABLE}."OUTSTANDING_FEES" ;;
  }

  dimension: outstanding_interest {
    type: number
    sql: ${TABLE}."OUTSTANDING_INTEREST" ;;
  }

  dimension: outstanding_late_fees {
    type: number
    sql: ${TABLE}."OUTSTANDING_LATE_FEES" ;;
  }

  dimension: overdue_ind {
    type: yesno
    sql: ${TABLE}."OVERDUE_IND" ;;
  }

  dimension: peach_loan_id {
    type: string
    sql: ${TABLE}."PEACH_LOAN_ID" ;;
  }

  dimension: pending_payment_amount_to_due_date {
    type: number
    sql: ${TABLE}."PENDING_PAYMENT_AMOUNT_TO_DUE_DATE" ;;
    value_format_name: usd
  }

  dimension_group: snap_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."SNAP_DATE" ;;
  }

  dimension: successful_payment_amount_to_due_date {
    type: number
    sql: ${TABLE}."SUCCESSFUL_PAYMENT_AMOUNT_TO_DUE_DATE" ;;
    value_format_name: usd
  }

  dimension: total_delinq_balance {
    type: number
    sql: ${TABLE}."TOTAL_DELINQ_BALANCE" ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}."USER_ID" ;;
    primary_key: yes
    link: {
      label: "Performance Details by User ID"
      url: "https://arro.cloud.looker.com/dashboards/9?User+ID={{ ['snapshot_bc.user_id'] | url_encode }}"
    }
  }

  dimension: zero_balance_ind {
    type: yesno
    sql: CASE WHEN ${outstanding_balance} = 0 THEN 'Yes' ELSE 'No' END ;;
  }

  measure: users {
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: overdue_users {
    type: count_distinct
    sql: CASE WHEN ${overdue_ind} = 'True' THEN ${user_id} END ;;
  }

  measure: overdue_rate {
    type: number
    sql: ${users} / ${overdue_users} ;;
    value_format_name: percent_1
  }

  measure: average_credit_limit {
    type: average
    sql: ${current_credit_limit} ;;
    value_format_name: usd_0
  }

  measure: average_credit_limit_growth {
    type: average
    sql: ${credit_limit_growth} ;;
    value_format_name: usd_0
  }

}
