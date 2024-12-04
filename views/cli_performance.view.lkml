view: cli_performance {
  sql_table_name: "CUSTOMER"."CLI_PERFORMANCE" ;;

  dimension_group: account_open {
    type: time
    timeframes: [month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."ACCOUNT_OPEN_MONTH" ;;
  }

  dimension: acrm1_score {
    type: number
    sql: ${TABLE}."ACRM1_SCORE" ;;
  }

  dimension: acrm1_bucket {
    type: string
    sql: CASE
      WHEN ${acrm1_score} <= 0.018 THEN 'a. 0.0-1.8'
      WHEN ${acrm1_score} <= 0.03 THEN 'b. 1.8-3.0'
      WHEN ${acrm1_score} <= 0.053 THEN 'c. 3.0-5.3'
      WHEN ${acrm1_score} <= 0.1 THEN 'd. 5.3-10.0'
      WHEN ${acrm1_score} > 0.1 THEN 'e. 10.0+'
    END ;;
  }

  dimension: apr {
    type: number
    sql: ${TABLE}."APR" ;;
  }
  dimension: autopay_enabled_ind {
    type: string
    sql: ${TABLE}."AUTOPAY_ENABLED_IND" ;;
  }
  dimension: available_credit {
    type: number
    sql: ${TABLE}."AVAILABLE_CREDIT" ;;
  }

  dimension: avg_1m_balance {
    type: number
    sql: ${TABLE}."AVG_1M_BALANCE" ;;
  }

  dimension: avg_balance_bucket {
    type: string
    sql: CASE
      WHEN ${avg_1m_balance} <= 0 THEN 'a. <=0'
      WHEN ${avg_1m_balance} <= 90 THEN 'b. $0-$90'
      WHEN ${avg_1m_balance} <= 390 THEN 'c. $90-$390'
      WHEN ${avg_1m_balance} <= 1120 THEN 'd. $390-$1120'
      WHEN ${avg_1m_balance} > 1120 THEN 'e. $1120+'
    END ;;
  }

  dimension: charged_off_account {
    type: number
    sql: ${TABLE}."CHARGED_OFF_ACCOUNT" ;;
  }

  dimension: cl_change_amount {
    type: string
    sql: CASE WHEN ${TABLE}."CL_CHANGE_AMOUNT" > 0 THEN ${TABLE}."CL_CHANGE_AMOUNT" END ;;
    value_format_name: usd_0
  }

  dimension: cl_change_bucket {
    type: string
    sql: ${TABLE}."CL_CHANGE_BUCKET" ;;
  }

  dimension_group: cl_change {
    type: time
    timeframes: [month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."CL_CHANGE_MONTH" ;;
  }
  dimension: closed_account {
    type: number
    sql: ${TABLE}."CLOSED_ACCOUNT" ;;
  }
  dimension: credit_limit_charged_off {
    type: number
    sql: ${TABLE}."CREDIT_LIMIT_CHARGED_OFF" ;;
  }
  dimension: credit_limit_closed {
    type: number
    sql: ${TABLE}."CREDIT_LIMIT_CLOSED" ;;
  }
  dimension: credit_limit_open {
    type: number
    sql: ${TABLE}."CREDIT_LIMIT_OPEN" ;;
  }
  dimension: days_overdue {
    type: number
    sql: ${TABLE}."DAYS_OVERDUE" ;;
  }
  dimension: dq_120_150_balance {
    type: number
    sql: ${TABLE}."DQ_120_150_BALANCE" ;;
  }
  dimension: dq_120_150_count {
    type: number
    sql: ${TABLE}."DQ_120_150_COUNT" ;;
  }
  dimension: dq_120plus_balance {
    type: string
    sql: ${TABLE}."DQ_120PLUS_BALANCE" ;;
  }
  dimension: dq_120plus_count {
    type: number
    sql: ${TABLE}."DQ_120PLUS_COUNT" ;;
  }
  dimension: dq_150_180_balance {
    type: number
    sql: ${TABLE}."DQ_150_180_BALANCE" ;;
  }
  dimension: dq_150_180_count {
    type: number
    sql: ${TABLE}."DQ_150_180_COUNT" ;;
  }
  dimension: dq_150plus_balance {
    type: string
    sql: ${TABLE}."DQ_150PLUS_BALANCE" ;;
  }
  dimension: dq_150plus_count {
    type: number
    sql: ${TABLE}."DQ_150PLUS_COUNT" ;;
  }
  dimension: dq_180plus_balance {
    type: string
    sql: ${TABLE}."DQ_180PLUS_BALANCE" ;;
  }
  dimension: dq_180plus_count {
    type: number
    sql: ${TABLE}."DQ_180PLUS_COUNT" ;;
  }
  dimension: dq_1_30_balance {
    type: number
    sql: ${TABLE}."DQ_1_30_BALANCE" ;;
  }
  dimension: dq_1_30_count {
    type: number
    sql: ${TABLE}."DQ_1_30_COUNT" ;;
  }
  dimension: dq_1plus_balance {
    type: string
    sql: ${TABLE}."DQ_1PLUS_BALANCE" ;;
  }
  dimension: dq_1plus_count {
    type: number
    sql: ${TABLE}."DQ_1PLUS_COUNT" ;;
  }
  dimension: dq_30_60_balance {
    type: number
    sql: ${TABLE}."DQ_30_60_BALANCE" ;;
  }
  dimension: dq_30_60_count {
    type: number
    sql: ${TABLE}."DQ_30_60_COUNT" ;;
  }
  dimension: dq_30plus_balance {
    type: string
    sql: ${TABLE}."DQ_30PLUS_BALANCE" ;;
  }
  dimension: dq_30plus_count {
    type: number
    sql: ${TABLE}."DQ_30PLUS_COUNT" ;;
  }
  dimension: dq_60_90_balance {
    type: number
    sql: ${TABLE}."DQ_60_90_BALANCE" ;;
  }
  dimension: dq_60_90_count {
    type: number
    sql: ${TABLE}."DQ_60_90_COUNT" ;;
  }
  dimension: dq_60plus_balance {
    type: string
    sql: ${TABLE}."DQ_60PLUS_BALANCE" ;;
  }
  dimension: dq_60plus_count {
    type: number
    sql: ${TABLE}."DQ_60PLUS_COUNT" ;;
  }
  dimension: dq_90_120_balance {
    type: number
    sql: ${TABLE}."DQ_90_120_BALANCE" ;;
  }
  dimension: dq_90_120_count {
    type: number
    sql: ${TABLE}."DQ_90_120_COUNT" ;;
  }
  dimension: dq_90plus_balance {
    type: string
    sql: ${TABLE}."DQ_90PLUS_BALANCE" ;;
  }
  dimension: dq_90plus_count {
    type: number
    sql: ${TABLE}."DQ_90PLUS_COUNT" ;;
  }
  dimension: fees_charged {
    type: number
    sql: ${TABLE}."FEES_CHARGED" ;;
  }
  dimension: gaco {
    type: number
    sql: ${TABLE}."GACO" ;;
  }
  dimension: guco {
    type: number
    sql: ${TABLE}."GUCO" ;;
  }
  dimension: interchange_amount {
    type: number
    sql: ${TABLE}."INTERCHANGE_AMOUNT" ;;
  }
  dimension: interchange_cost {
    type: number
    sql: ${TABLE}."INTERCHANGE_COST" ;;
  }
  dimension: interest_charged {
    type: number
    sql: ${TABLE}."INTEREST_CHARGED" ;;
  }

  dimension: lowest_1m_balance {
    type: number
    sql: ${TABLE}."LOWEST_1M_BALANCE" ;;
  }

  dimension: lowest_1m_balance_bucket {
    type: string
    sql: CASE
      WHEN ${lowest_1m_balance} <= 0 THEN 'a. <=0'
      WHEN ${avg_1m_balance} <= 10 THEN 'b. $0-$10'
      WHEN ${avg_1m_balance} <= 50 THEN 'c. $10-$50'
      WHEN ${avg_1m_balance} <= 200 THEN 'd. $50-$200'
      WHEN ${avg_1m_balance} > 200 THEN 'e. 200+'
    END ;;
  }

  dimension: naco {
    type: number
    sql: ${TABLE}."NACO" ;;
  }
  dimension: net_purchase_volume {
    type: number
    sql: ${TABLE}."NET_PURCHASE_VOLUME" ;;
  }
  dimension: nuco {
    type: number
    sql: ${TABLE}."NUCO" ;;
  }
  dimension: open_account {
    type: number
    sql: ${TABLE}."OPEN_ACCOUNT" ;;
  }

  dimension: original_accounts {
    type: number
    sql: ${TABLE}."ORIGINAL_ACCOUNTS" ;;
  }

  dimension: overdue_ind {
    type: yesno
    sql: ${TABLE}."OVERDUE_IND" ;;
  }
  dimension: payment_volume {
    type: number
    sql: ${TABLE}."PAYMENT_VOLUME" ;;
  }
  dimension: prev_statement_balance {
    type: number
    sql: ${TABLE}."PREV_STATEMENT_BALANCE" ;;
  }
  dimension: prev_statement_fees_paid {
    type: string
    sql: ${TABLE}."PREV_STATEMENT_FEES_PAID" ;;
  }
  dimension: prev_statement_interest_paid {
    type: string
    sql: ${TABLE}."PREV_STATEMENT_INTEREST_PAID" ;;
  }

  dimension: primary_key {
    type: string
    sql: ${user_id} || ${cl_change_month} ;;
  }

  dimension: principal_balance {
    type: string
    sql: ${TABLE}."PRINCIPAL_BALANCE" ;;
  }
  dimension: recoveries {
    type: number
    sql: ${TABLE}."RECOVERIES" ;;
  }
  dimension: returned_payment_volume {
    type: number
    sql: ${TABLE}."RETURNED_PAYMENT_VOLUME" ;;
  }
  dimension: revenue {
    type: number
    sql: ${TABLE}."REVENUE" ;;
  }
  dimension: statement_balance {
    type: number
    sql: ${TABLE}."STATEMENT_BALANCE" ;;
  }
  dimension_group: statement_end {
    type: time
    timeframes: [date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."STATEMENT_END_DATE" ;;
  }
  dimension_group: statement {
    type: time
    timeframes: [month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."STATEMENT_MONTH" ;;
  }
  dimension: statement_number {
    type: number
    sql: ${TABLE}."STATEMENT_NUMBER" ;;
  }
  dimension: statement_recency {
    type: number
    sql: ${TABLE}."STATEMENT_RECENCY" ;;
  }
  dimension: total_purchase_amount {
    type: number
    sql: ${TABLE}."TOTAL_PURCHASE_AMOUNT" ;;
  }
  dimension: total_refund_amount {
    type: number
    sql: ${TABLE}."TOTAL_REFUND_AMOUNT" ;;
  }
  dimension: user_id {
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: users {
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: total_open_accounts {
    type: sum
    sql: ${open_account};;
  }

  measure: total_original_accounts {
    type: sum
    sql: CASE WHEN COALESCE(${statement_number},0) = 1 THEN ${original_accounts} END;;
  }

  measure: total_open_accounts_excluding_randd {
    type: sum
    sql: CASE WHEN ${user_profile.policy_20230929_approval_ind} = 'Approved' THEN ${open_account} END;;
  }

  measure: total_open_accounts_arm2_approved {
    type: sum
    sql: CASE WHEN ${user_profile.policy_20240117_approval_ind} = 'Approved' THEN ${open_account} END;;
  }

  measure: total_closed_accounts {
    type: sum
    sql: ${closed_account};;
  }

  measure: total_charged_off_accounts {
    type: sum
    sql: ${charged_off_account};;
  }

  measure: total_guco {
    type: sum
    sql: ${guco};;
    value_format_name: usd
  }

  measure: total_nuco {
    type: sum
    sql: ${nuco};;
    value_format_name: usd
  }

  measure: total_naco {
    type: sum
    sql: ${naco};;
    value_format_name: usd
  }

  measure: guco_rate {
    type: number
    sql: ${total_guco} / ${total_outstanding_balance};;
    value_format_name: percent_1
  }

  measure: chargeoff_severity {
    type: number
    sql: ${total_guco} / NULLIF(${total_charged_off_accounts},0) ;;
    value_format_name: usd
  }

  measure: nuco_rate {
    type: number
    sql: ${total_nuco} / ${total_outstanding_balance};;
    value_format_name: percent_1
  }

  measure: naco_rate {
    type: number
    sql: ${total_naco} / ${total_outstanding_balance};;
    value_format_name: percent_1
  }

  measure: chargeoff_account_rate {
    type: number
    sql: ${total_charged_off_accounts} / ${total_open_accounts};;
    value_format_name: percent_1
  }

  measure: attrition_per_open_account {
    type: number
    sql: ${total_closed_accounts}/ NULLIF(${total_open_accounts},0) ;;
    value_format_name: percent_1
  }

  measure: total_open_exposure {
    type: sum
    sql: ${credit_limit_open};;
  }

  measure: total_open_exposure_excluding_randd {
    type: sum
    sql: CASE WHEN ${user_profile.policy_20230929_approval_ind} = 'Approved' THEN ${credit_limit_open} END ;;
  }

  measure: total_open_exposure_arm2_approved {
    type: sum
    sql: CASE WHEN ${user_profile.policy_20240117_approval_ind} = 'Approved' THEN ${credit_limit_open} END ;;
  }

  measure: credit_limit_per_open {
    type: number
    sql: ${total_open_exposure}/ NULLIF(${total_open_accounts},0) ;;
    value_format_name: usd
  }

  measure: credit_limit_per_open_excluding_randd {
    type: number
    sql: ${total_open_exposure_excluding_randd}/ NULLIF(${total_open_accounts_excluding_randd},0) ;;
    value_format_name: usd
  }

  measure: credit_limit_per_open_arm2_approved {
    type: number
    sql: ${total_open_exposure_arm2_approved}/ NULLIF(${total_open_accounts_arm2_approved},0) ;;
    value_format_name: usd
  }

  measure: total_outstanding_balance {
    type: sum
    sql: ${statement_balance};;
    value_format_name: usd
  }

  measure: prev_statement_total_outstanding_balance {
    type: sum
    sql: ${prev_statement_balance};;
    value_format_name: usd
  }

  measure: outstanding_balance_per_open {
    type: number
    sql: ${total_outstanding_balance}/ NULLIF(${total_open_accounts},0) ;;
    value_format_name: usd
  }

  measure: utilization {
    type: number
    sql: ${total_outstanding_balance}/NULLIF(${total_open_exposure},0) ;;
    value_format_name: percent_1
  }

  measure: total_purchase_volume {
    type: sum
    sql: ${net_purchase_volume} ;;
  }

  measure: purchase_volume_per_open {
    type: number
    sql: ${total_purchase_volume}/NULLIF(${total_open_accounts},0) ;;
    value_format_name: usd
  }

  measure: purchase_volume_utilization {
    type: number
    sql: ${total_purchase_volume}/NULLIF(${total_open_exposure},0) ;;
    value_format_name: percent_1
  }

  measure: total_payment_volume {
    type: sum
    sql: ${payment_volume} ;;
  }

  measure: total_returned_payment_volume {
    type: sum
    sql: ${returned_payment_volume} ;;
  }

  measure: total_revenue {
    type: sum
    sql: ${revenue} ;;
    value_format_name: usd
  }

  measure: total_interest_charged {
    type: sum
    sql: ${interest_charged} ;;
  }

  measure: total_fees_charged {
    type: sum
    sql: ${interest_charged} ;;
  }

  measure: payment_volume_per_open {
    type: number
    sql: ${total_payment_volume}/ NULLIF(${total_open_accounts},0) ;;
    value_format_name: usd
  }

  measure: payment_ratio {
    type: number
    sql: CASE WHEN ${statement_number} = 1 THEN 0 ELSE ${total_payment_volume}/ NULLIF(${prev_statement_total_outstanding_balance},0) END ;;
    value_format_name: percent_1
  }

  measure: returned_payment_volume_per_open {
    type: number
    sql: ${total_returned_payment_volume}/NULLIF(${total_open_accounts},0) ;;
    value_format_name: usd
  }

  measure: revenue_per_open {
    type: number
    sql: ${total_revenue}/ NULLIF(${total_open_accounts},0) ;;
    value_format_name: usd
  }

  measure: interest_per_open {
    type: number
    sql: ${total_interest_charged}/ NULLIF(${total_open_accounts},0) ;;
    value_format_name: usd
  }

  measure: fees_per_open {
    type: number
    sql: ${total_fees_charged}/ NULLIF(${total_open_accounts},0) ;;
    value_format_name: usd
  }

  measure: current_accounts {
    type: count_distinct
    sql: CASE WHEN ${days_overdue} = 0 THEN ${user_id} END;;
  }

  measure: dq_1plus_accounts {
    type: sum
    sql: CASE
      WHEN ${statement_balance} <= 5 THEN 0
      WHEN ${principal_balance} = 0 THEN 0
      ELSE ${dq_1plus_count}
    END;;
  }

  measure: dq_1plus_account_rate {
    type: number
    sql: ${dq_1plus_accounts}/ NULLIF(${total_open_accounts},0) ;;
    value_format_name: percent_1
  }

  measure: current_dollars {
    type: sum
    sql: CASE WHEN ${days_overdue} = 0 THEN ${principal_balance} END;;
  }

  measure: dq_1plus_dollars {
    type: sum
    sql: ${dq_1plus_balance} ;;
    value_format_name: usd
  }

  measure: dq_1plus_dollar_rate {
    type: number
    sql: ${dq_1plus_dollars}/ NULLIF(${total_outstanding_balance},0) ;;
    value_format_name: percent_1
  }

  measure: dq_30plus_accounts {
    type: sum
    sql: CASE
      WHEN ${statement_balance} <= 5 THEN 0
      WHEN ${principal_balance} = 0 THEN 0
      ELSE ${dq_30plus_count}
    END;;
  }

  measure: dq_30plus_account_rate {
    type: number
    sql: ${dq_30plus_accounts}/ NULLIF(${total_open_accounts},0) ;;
    value_format_name: percent_1
  }

  measure: dq_30plus_dollars {
    type: sum
    sql: ${dq_30plus_balance} ;;
    value_format_name: usd
  }

  measure: dq_30plus_dollar_rate {
    type: number
    sql: ${dq_30plus_dollars}/ NULLIF(${total_outstanding_balance},0) ;;
    value_format_name: percent_1
  }

  measure: average_dq_30plus_balance {
    type: average
    sql: CASE WHEN ${dq_30plus_balance} = 0 THEN NULL ELSE ${dq_30plus_balance} END ;;
    value_format_name: usd
  }

  measure: dq_60plus_accounts {
    type: sum
    sql: CASE
      WHEN ${statement_balance} <= 5 THEN 0
      WHEN ${principal_balance} = 0 THEN 0
      ELSE ${dq_60plus_count}
    END;;
  }

  measure: dq_60plus_account_rate {
    type: number
    sql: ${dq_60plus_accounts}/ NULLIF(${total_open_accounts},0) ;;
    value_format_name: percent_1
  }

  measure: dq_60plus_dollars {
    type: sum
    sql: ${dq_60plus_balance} ;;
    value_format_name: usd
  }

  measure: dq_60plus_dollar_rate {
    type: number
    sql: ${dq_60plus_dollars}/ NULLIF(${total_outstanding_balance},0) ;;
    value_format_name: percent_1
  }

  measure: dq_90plus_accounts {
    type: sum
    sql: CASE
      WHEN ${statement_balance} <= 5 THEN 0
      WHEN ${principal_balance} = 0 THEN 0
      ELSE ${dq_90plus_count}
    END ;;
  }

  measure: dq_90plus_account_rate {
    type: number
    sql: ${dq_90plus_accounts}/ NULLIF(${total_open_accounts},0) ;;
    value_format_name: percent_1
  }

  measure: dq_90plus_dollars {
    type: sum
    sql: ${dq_90plus_balance} ;;
    value_format_name: usd
  }

  measure: dq_90plus_dollar_rate {
    type: number
    sql: ${dq_90plus_dollars}/ NULLIF(${total_outstanding_balance},0) ;;
    value_format_name: percent_1
  }

  measure: dq_120plus_accounts {
    type: sum
    sql: CASE
      WHEN ${statement_balance} <= 5 THEN 0
      WHEN ${principal_balance} = 0 THEN 0
      ELSE ${dq_120plus_count}
    END;;
  }

  measure: dq_120plus_account_rate {
    type: number
    sql: ${dq_120plus_accounts}/ NULLIF(${total_open_accounts},0) ;;
    value_format_name: percent_1
  }

  measure: dq_120plus_dollars {
    type: sum
    sql: ${dq_120plus_balance} ;;
    value_format_name: usd
  }

  measure: dq_120plus_dollar_rate {
    type: number
    sql: ${dq_120plus_dollars}/NULLIF(${total_outstanding_balance},0) ;;
    value_format_name: percent_1
  }

  measure: dq_150plus_accounts {
    type: sum
    sql: CASE
      WHEN ${statement_balance} <= 5 THEN 0
      WHEN ${principal_balance} = 0 THEN 0
      ELSE ${dq_150plus_count}
    END;;
  }

  measure: dq_150plus_account_rate {
    type: number
    sql: ${dq_150plus_accounts}/NULLIF(${total_open_accounts},0) ;;
    value_format_name: percent_1
  }

  measure: dq_150plus_dollars {
    type: sum
    sql: ${dq_150plus_balance} ;;
    value_format_name: usd
  }

  measure: dq_150plus_dollar_rate {
    type: number
    sql: ${dq_150plus_dollars}/NULLIF(${total_outstanding_balance},0) ;;
    value_format_name: percent_1
  }

  measure: dq_180plus_accounts {
    type: sum
    sql: CASE
      WHEN ${statement_balance} <= 5 THEN 0
      WHEN ${principal_balance} = 0 THEN 0
      ELSE ${dq_180plus_count}
    END ;;
  }

  measure: dq_180plus_account_rate {
    type: number
    sql: ${dq_180plus_accounts}/NULLIF(${total_open_accounts},0) ;;
    value_format_name: percent_1
  }

  measure: dq_180plus_dollars {
    type: sum
    sql: ${dq_180plus_balance} ;;
    value_format_name: usd
  }

  measure: dq_180plus_dollar_rate {
    type: number
    sql: ${dq_180plus_dollars}/NULLIF(${total_outstanding_balance},0) ;;
    value_format_name: percent_1
  }


  measure: dq_1_30_accounts {
    type: sum
    sql: CASE WHEN ${statement_balance} > 5 THEN ${dq_1_30_count} END ;;
  }

  measure: dq_1_30_account_rate {
    type: number
    sql: ${dq_1_30_accounts}/NULLIF(${total_open_accounts},0) ;;
    value_format_name: percent_1
  }

  measure: dq_1_30_dollars {
    type: sum
    sql: ${dq_1_30_balance} ;;
    value_format_name: usd
  }

  measure: dq_1_30_dollar_rate {
    type: number
    sql: ${dq_1_30_dollars}/NULLIF(${total_outstanding_balance},0) ;;
    value_format_name: percent_1
  }

  measure: dq_30_60_accounts {
    type: sum
    sql: CASE WHEN ${statement_balance} > 5 THEN ${dq_30_60_count} END;;
  }

  measure: dq_30_60_account_rate {
    type: number
    sql: ${dq_30_60_accounts}/NULLIF(${total_open_accounts},0) ;;
    value_format_name: percent_1
  }

  measure: dq_30_60_dollars {
    type: sum
    sql: ${dq_30_60_balance} ;;
    value_format_name: usd
  }

  measure: dq_30_60_dollar_rate {
    type: number
    sql: ${dq_30_60_dollars}/NULLIF(${total_outstanding_balance},0) ;;
    value_format_name: percent_1
  }

  measure: dq_60_90_accounts {
    type: sum
    sql: CASE WHEN ${statement_balance} > 5 THEN ${dq_60_90_count} END;;
  }

  measure: dq_60_90_account_rate {
    type: number
    sql: ${dq_60_90_accounts}/NULLIF(${total_open_accounts},0) ;;
    value_format_name: percent_1
  }

  measure: dq_60_90_dollars {
    type: sum
    sql: ${dq_60_90_balance} ;;
    value_format_name: usd
  }

  measure: dq_60_90_dollar_rate {
    type: number
    sql: ${dq_60_90_dollars}/NULLIF(${total_outstanding_balance},0) ;;
    value_format_name: percent_1
  }

  measure: dq_90_120_accounts {
    type: sum
    sql: CASE WHEN ${statement_balance} > 5 THEN ${dq_90_120_count} END ;;
  }

  measure: dq_90_120_account_rate {
    type: number
    sql: ${dq_90_120_accounts}/NULLIF(${total_open_accounts},0) ;;
    value_format_name: percent_1
  }

  measure: dq_90_120_dollars {
    type: sum
    sql: ${dq_90_120_balance} ;;
    value_format_name: usd
  }

  measure: dq_90_120_dollar_rate {
    type: number
    sql: ${dq_90_120_dollars}/NULLIF(${total_outstanding_balance},0) ;;
    value_format_name: percent_1
  }

  measure: dq_120_150_accounts {
    type: sum
    sql: CASE WHEN ${statement_balance} > 5 THEN ${dq_120_150_count} END;;
  }

  measure: dq_120_150_account_rate {
    type: number
    sql: ${dq_120_150_accounts}/NULLIF(${total_open_accounts},0) ;;
    value_format_name: percent_1
  }

  measure: dq_120_150_dollars {
    type: sum
    sql: ${dq_120_150_balance} ;;
    value_format_name: usd
  }

  measure: dq_120_150_dollar_rate {
    type: number
    sql: ${dq_120_150_dollars}/NULLIF(${total_outstanding_balance},0) ;;
    value_format_name: percent_1
  }

  measure: dq_150_180_accounts {
    type: sum
    sql: CASE WHEN ${statement_balance} > 5 THEN ${dq_150_180_count} END ;;
  }

  measure: dq_150_180_account_rate {
    type: number
    sql: ${dq_150_180_accounts}/NULLIF(${total_open_accounts},0) ;;
    value_format_name: percent_1
  }

  measure: dq_150_180_dollars {
    type: sum
    sql: ${dq_150_180_balance} ;;
    value_format_name: usd
  }

  measure: dq_150_180_dollar_rate {
    type: number
    sql: ${dq_150_180_dollars}/NULLIF(${total_outstanding_balance},0) ;;
    value_format_name: percent_1
  }

  measure: autopay_enabled_users {
    type: count_distinct
    sql: Case WHEN ${autopay_enabled_ind} = 'Enabled' THEN ${user_id} END ;;
  }

  measure: autopay_enabled_rate {
    type: number
    sql: ${autopay_enabled_users}/${users} ;;
    value_format_name: percent_0
  }

  measure: balance_per_current {
    type: number
    sql: ${current_dollars} / NULLIF(${current_accounts},0) ;;
    value_format_name: usd
  }

  measure: balance_per_dq30plus {
    type: number
    sql: ${dq_30plus_dollars} / NULLIF(${dq_30plus_accounts},0) ;;
    value_format_name: usd
  }

  measure: balance_per_dq60plus {
    type: number
    sql: ${dq_60plus_dollars} / NULLIF(${dq_60plus_accounts},0) ;;
    value_format_name: usd
  }

  measure: current_to_dq30plus_balance_ratio {
    type: number
    sql: ${balance_per_current}/ NULLIF(${balance_per_dq30plus},0) ;;
    value_format_name: decimal_2
  }

  measure: current_to_dq60plus_balance_ratio {
    type: number
    sql: ${balance_per_current}/ NULLIF(${balance_per_dq60plus},0) ;;
    value_format_name: decimal_2
  }

  measure: users_paying_full_statement_balance {
    type: count_distinct
    sql: CASE WHEN ${payment_volume} >= ${prev_statement_balance} THEN ${user_id}||${statement_number} END ;;
  }

  measure: full_statement_balance_rate {
    type: number
    sql: ${users_paying_full_statement_balance} / ${total_open_accounts} ;;
    value_format_name: percent_1
  }

  measure: average_apr {
    type: average
    sql: ${apr} ;;
    value_format_name: percent_1
  }

  measure: statement2_dq1plus_accounts {
    type: sum
    sql: CASE
      WHEN ${statement_balance} <= 5 THEN 0
      WHEN ${principal_balance} = 0 THEN 0
      WHEN ${statement_number} != 2 THEN 0
      ELSE ${dq_1plus_count}
    END ;;
  }

  measure: statement2_dq1plus_dollars {
    type: sum
    sql: CASE WHEN ${statement_number} = 2 THEN ${dq_1plus_balance} END ;;
    value_format_name: usd
  }

  measure: statement2_dq30plus_accounts {
    type: sum
    sql: CASE
      WHEN ${statement_balance} <= 5 THEN 0
      WHEN ${principal_balance} = 0 THEN 0
      WHEN ${statement_number} != 2 THEN 0
      ELSE ${dq_30plus_count}
    END ;;
  }

  measure: statement2_dq30plus_dollars {
    type: sum
    sql: CASE WHEN ${statement_number} = 2 THEN ${dq_30plus_balance} END ;;
    value_format_name: usd
  }

  measure: statement2_open_accounts {
    type: sum
    sql: CASE WHEN ${statement_number} = 2 THEN ${open_account} END ;;
  }

  measure: statement2_outstanding_balance {
    type: sum
    sql: CASE WHEN ${statement_number} = 2 THEN ${statement_balance} END ;;
  }

  measure: statement4_dq1plus_accounts {
    type: sum
    sql: CASE
      WHEN ${statement_balance} <= 5 THEN 0
      WHEN ${principal_balance} = 0 THEN 0
      WHEN ${statement_number} != 4 THEN 0
      ELSE ${dq_1plus_count}
    END ;;
  }

  measure: statement4_dq1plus_dollars {
    type: sum
    sql: CASE WHEN ${statement_number} = 4 THEN ${dq_1plus_balance} END ;;
    value_format_name: usd
  }

  measure: statement4_dq30plus_accounts {
    type: sum
    sql: CASE
      WHEN ${statement_balance} <= 5 THEN 0
      WHEN ${principal_balance} = 0 THEN 0
      WHEN ${statement_number} != 4 THEN 0
      ELSE ${dq_30plus_count}
    END ;;
  }

  measure: statement4_dq30plus_dollars {
    type: sum
    sql: CASE WHEN ${statement_number} = 4 THEN ${dq_30plus_balance} END ;;
    value_format_name: usd
  }

  measure: statement4_open_accounts {
    type: sum
    sql: CASE WHEN ${statement_number} = 4 THEN ${open_account} END ;;
  }

  measure: statement4_outstanding_balance {
    type: sum
    sql: CASE WHEN ${statement_number} = 4 THEN ${statement_balance} END ;;
  }

  measure: statement6_dq1plus_accounts {
    type: sum
    sql: CASE
      WHEN ${statement_balance} <= 5 THEN 0
      WHEN ${principal_balance} = 0 THEN 0
      WHEN ${statement_number} != 6 THEN 0
      ELSE ${dq_1plus_count}
    END ;;
  }

  measure: statement6_dq1plus_dollars {
    type: sum
    sql: CASE WHEN ${statement_number} = 6 THEN ${dq_1plus_balance} END ;;
    value_format_name: usd
  }

  measure: statement6_dq30plus_accounts {
    type: sum
    sql: CASE
      WHEN ${statement_balance} <= 5 THEN 0
      WHEN ${principal_balance} = 0 THEN 0
      WHEN ${statement_number} != 6 THEN 0
      ELSE ${dq_30plus_count}
    END ;;
  }

  measure: statement6_dq30plus_dollars {
    type: sum
    sql: CASE WHEN ${statement_number} = 6 THEN ${dq_30plus_balance} END ;;
    value_format_name: usd
  }

  measure: statement6_open_accounts {
    type: sum
    sql: CASE WHEN ${statement_number} = 6 THEN ${open_account} END ;;
  }

  measure: statement6_outstanding_balance {
    type: sum
    sql: CASE WHEN ${statement_number} = 6 THEN ${statement_balance} END ;;
  }

  measure: statement2_dq_1plus_account_rate {
    type: number
    sql: ${statement2_dq1plus_accounts}/ NULLIF(${statement2_open_accounts},0) ;;
    value_format_name: percent_1
  }

  measure: statement2_dq_1plus_dollar_rate {
    type: number
    sql: ${statement2_dq1plus_dollars}/ NULLIF(${statement2_outstanding_balance},0) ;;
    value_format_name: percent_1
  }

  measure: statement2_dq_30plus_account_rate {
    type: number
    sql: ${statement2_dq30plus_accounts}/ NULLIF(${statement2_open_accounts},0) ;;
    value_format_name: percent_1
  }

  measure: statement2_dq_30plus_dollar_rate {
    type: number
    sql: ${statement2_dq30plus_dollars}/ NULLIF(${statement2_outstanding_balance},0) ;;
    value_format_name: percent_1
  }

  measure: statement4_dq_1plus_account_rate {
    type: number
    sql: ${statement4_dq1plus_accounts}/ NULLIF(${statement4_open_accounts},0) ;;
    value_format_name: percent_1
  }

  measure: statement4_dq_1plus_dollar_rate {
    type: number
    sql: ${statement4_dq1plus_dollars}/ NULLIF(${statement4_outstanding_balance},0) ;;
    value_format_name: percent_1
  }

  measure: statement4_dq_30plus_account_rate {
    type: number
    sql: ${statement4_dq30plus_accounts}/ NULLIF(${statement4_open_accounts},0) ;;
    value_format_name: percent_1
  }

  measure: statement4_dq_30plus_dollar_rate {
    type: number
    sql: ${statement4_dq30plus_dollars}/ NULLIF(${statement4_outstanding_balance},0) ;;
    value_format_name: percent_1
  }

  measure: statement6_dq_1plus_account_rate {
    type: number
    sql: ${statement6_dq1plus_accounts}/ NULLIF(${statement6_open_accounts},0) ;;
    value_format_name: percent_1
  }

  measure: statement6_dq_1plus_dollar_rate {
    type: number
    sql: ${statement6_dq1plus_dollars}/ NULLIF(${statement6_outstanding_balance},0) ;;
    value_format_name: percent_1
  }

  measure: statement6_dq_30plus_account_rate {
    type: number
    sql: ${statement6_dq30plus_accounts}/ NULLIF(${statement6_open_accounts},0) ;;
    value_format_name: percent_1
  }

  measure: statement6_dq_30plus_dollar_rate {
    type: number
    sql: ${statement6_dq30plus_dollars}/ NULLIF(${statement6_outstanding_balance},0) ;;
    value_format_name: percent_1
  }

  measure: total_cl_growth {
    type: sum
    sql: CASE WHEN coalesce(${statement_number},1) = 1 THEN ${cl_change_amount} END ;;
    value_format_name: usd_0
  }

  measure: total_cl_growth_per_open_account {
    type: number
    sql: ${total_cl_growth}/${total_original_accounts} ;;
    value_format_name: usd_0
  }

  measure: average_acrm1_score {
    type: average
    sql: ${acrm1_score} ;;
    value_format_name: decimal_3
  }

  measure: median_acrm1_score {
    type: number
    sql: MEDIAN(${acrm1_score}) ;;
    value_format_name: decimal_3
  }
}
