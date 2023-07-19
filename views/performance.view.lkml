view: performance {
  sql_table_name: "CUSTOMER"."PERFORMANCE" ;;

  dimension: available_credit {
    type: number
    sql: ${TABLE}."AVAILABLE_CREDIT" ;;
  }
  dimension: charged_off_account {
    type: number
    sql: ${TABLE}."CHARGED_OFF_ACCOUNT" ;;
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

  dimension: dq_1plus_count {
    type: number
    sql: ${TABLE}."DQ_1PLUS_COUNT" ;;
  }

  dimension: dq_1plus_balance {
    type: number
    sql: ${TABLE}."DQ_1PLUS_BALANCE" ;;
  }

  dimension: dq_30plus_count {
    type: number
    sql: ${TABLE}."DQ_30PLUS_COUNT" ;;
  }

  dimension: dq_30plus_balance {
    type: number
    sql: ${TABLE}."DQ_30PLUS_BALANCE" ;;
  }

  dimension: dq_60plus_count {
    type: number
    sql: ${TABLE}."DQ_60PLUS_COUNT" ;;
  }

  dimension: dq_60plus_balance {
    type: number
    sql: ${TABLE}."DQ_60PLUS_BALANCE" ;;
  }

  dimension: dq_90plus_count {
    type: number
    sql: ${TABLE}."DQ_90PLUS_COUNT" ;;
  }

  dimension: dq_90plus_balance {
    type: number
    sql: ${TABLE}."DQ_90PLUS_BALANCE" ;;
  }

  dimension: dq_120plus_count {
    type: number
    sql: ${TABLE}."DQ_120PLUS_COUNT" ;;
  }

  dimension: dq_120plus_balance {
    type: number
    sql: ${TABLE}."DQ_120PLUS_BALANCE" ;;
  }

  dimension: dq_150plus_count {
    type: number
    sql: ${TABLE}."DQ_150PLUS_COUNT" ;;
  }

  dimension: dq_150plus_balance {
    type: number
    sql: ${TABLE}."DQ_150PLUS_BALANCE" ;;
  }

  dimension: dq_180plus_count {
    type: number
    sql: ${TABLE}."DQ_180PLUS_COUNT" ;;
  }

  dimension: dq_180plus_balance {
    type: number
    sql: ${TABLE}."DQ_180PLUS_BALANCE" ;;
  }

  dimension: dq_1_30_count {
    type: number
    sql: ${TABLE}."DQ_1_30_COUNT" ;;
  }

  dimension: dq_1_30_balance {
    type: number
    sql: ${TABLE}."DQ_1_30_BALANCE" ;;
  }

  dimension: dq_30_60_count {
    type: number
    sql: ${TABLE}."DQ_30_60_COUNT" ;;
  }

  dimension: dq_30_60_balance {
    type: number
    sql: ${TABLE}."DQ_30_60_BALANCE" ;;
  }

  dimension: dq_60_90_count {
    type: number
    sql: ${TABLE}."DQ_60_90_COUNT" ;;
  }

  dimension: dq_60_90_balance {
    type: number
    sql: ${TABLE}."DQ_60_90_BALANCE" ;;
  }

  dimension: dq_90_120_count {
    type: number
    sql: ${TABLE}."DQ_90_120_COUNT" ;;
  }

  dimension: dq_90_120_balance {
    type: number
    sql: ${TABLE}."DQ_90_120_BALANCE" ;;
  }

  dimension: dq_120_150_count {
    type: number
    sql: ${TABLE}."DQ_120_150_COUNT" ;;
  }

  dimension: dq_120_150_balance {
    type: number
    sql: ${TABLE}."DQ_120_150_BALANCE" ;;
  }

  dimension: dq_150_180_count {
    type: number
    sql: ${TABLE}."DQ_150_180_COUNT" ;;
  }

  dimension: dq_150_180_balance {
    type: number
    sql: ${TABLE}."DQ_150_180_BALANCE" ;;
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
  dimension_group: last_update_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."LAST_UPDATE_TS" ;;
  }
  dimension: net_purchase_volume {
    type: number
    sql: ${TABLE}."NET_PURCHASE_VOLUME" ;;
  }
  dimension: open_account {
    type: number
    sql: ${TABLE}."OPEN_ACCOUNT" ;;
  }
  dimension: overdue_ind {
    type: yesno
    sql: ${TABLE}."OVERDUE_IND" ;;
  }

  dimension: payment_volume {
    type: number
    sql: ${TABLE}."PAYMENT_NUMBER" ;;
    value_format_name: usd
  }

  dimension: prev_statement_balance {
    type: number
    sql: ${TABLE}."PREV_STATEMENT_BALANCE" ;;
  }
  dimension: prev_statement_fees_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}."PREV_STATEMENT_FEES_PAID" ;;
  }
  dimension: prev_statement_interest_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}."PREV_STATEMENT_INTEREST_PAID" ;;
  }
  dimension: statement_balance {
    type: number
    sql: ${TABLE}."STATEMENT_BALANCE" ;;
  }
  dimension: statement_number {
    type: number
    sql: ${TABLE}."STATEMENT_NUMBER" ;;
  }

  dimension: statement_month {
    type: number
    sql: ${TABLE}."STATEMENT_MONTH" ;;
  }

  dimension: statement_recency {
    type: number
    sql: ${TABLE}."STATEMENT_RECENCY" ;;
  }
  dimension_group: stmt_end_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."STMT_END_DATE" ;;
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
    primary_key: yes
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: users {
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: original_accounts {
    type: count_distinct
    sql: CASE WHEN ${statement_number} = 1 THEN ${user_id} END ;;
  }

  measure: total_open_accounts {
    type: sum
    sql: ${open_account};;
  }

  measure: total_closed_accounts {
    type: sum
    sql: ${closed_account};;
  }

  measure: total_charged_off_accounts {
    type: sum
    sql: ${charged_off_account};;
  }

  measure: total_open_exposure {
    type: sum
    sql: ${credit_limit_open};;
  }

  measure: credit_limit_per_open {
    type: number
    sql: ${total_open_exposure}/${total_open_accounts};;
    value_format_name: usd
  }

  measure: total_outstanding_balance {
    type: sum
    sql: ${statement_balance};;
    value_format_name: usd
  }

  measure: outstanding_balance_per_open {
    type: number
    sql: ${total_outstanding_balance}/${total_open_accounts};;
    value_format_name: usd
  }

  measure: utilization {
    type: number
    sql: ${total_outstanding_balance}/${total_open_exposure};;
    value_format_name: percent_1
  }

  measure: total_purchase_volume {
    type: sum
    sql: ${net_purchase_volume} ;;
  }

  measure: purchase_volume_per_open {
    type: number
    sql: ${total_purchase_volume}/${total_open_accounts} ;;
  }

  measure: total_payment_volume {
    type: sum
    sql: ${payment_volume} ;;
  }

  measure: payment_volume_per_open {
    type: number
    sql: ${total_payment_volume}/${total_open_accounts} ;;
  }

  measure: dq_1plus_accounts {
    type: sum
    sql: ${dq_1plus_count} ;;
    value_format_name: percent_1
  }

  measure: dq_1plus_account_rate {
    type: number
    sql: ${dq_1plus_accounts}/${total_open_accounts} ;;
    value_format_name: percent_1
  }

  measure: dq_1plus_dollars {
    type: sum
    sql: ${dq_1plus_balance} ;;
    value_format_name: percent_1
  }

  measure: dq_1plus_dollar_rate {
    type: number
    sql: ${dq_1plus_balance}/${total_outstanding_balance} ;;
    value_format_name: percent_1
  }

  measure: dq_30plus_accounts {
    type: sum
    sql: ${dq_30plus_count} ;;
    value_format_name: percent_1
  }

  measure: dq_30plus_account_rate {
    type: number
    sql: ${dq_30plus_accounts}/${total_open_accounts} ;;
    value_format_name: percent_1
  }

  measure: dq_30plus_dollars {
    type: sum
    sql: ${dq_30plus_balance} ;;
    value_format_name: percent_1
  }

  measure: dq_30plus_dollar_rate {
    type: number
    sql: ${dq_30plus_balance}/${total_outstanding_balance} ;;
    value_format_name: percent_1
  }

  measure: dq_60plus_accounts {
    type: sum
    sql: ${dq_60plus_count} ;;
    value_format_name: percent_1
  }

  measure: dq_60plus_account_rate {
    type: number
    sql: ${dq_60plus_accounts}/${total_open_accounts} ;;
    value_format_name: percent_1
  }

  measure: dq_60plus_dollars {
    type: sum
    sql: ${dq_60plus_balance} ;;
    value_format_name: percent_1
  }

  measure: dq_60plus_dollar_rate {
    type: number
    sql: ${dq_60plus_balance}/${total_outstanding_balance} ;;
    value_format_name: percent_1
  }

  measure: dq_90plus_accounts {
    type: sum
    sql: ${dq_90plus_count} ;;
    value_format_name: percent_1
  }

  measure: dq_90plus_account_rate {
    type: number
    sql: ${dq_90plus_accounts}/${total_open_accounts} ;;
    value_format_name: percent_1
  }

  measure: dq_90plus_dollars {
    type: sum
    sql: ${dq_90plus_balance} ;;
    value_format_name: percent_1
  }

  measure: dq_90plus_dollar_rate {
    type: number
    sql: ${dq_90plus_balance}/${total_outstanding_balance} ;;
    value_format_name: percent_1
  }

  measure: dq_120plus_accounts {
    type: sum
    sql: ${dq_120plus_count} ;;
    value_format_name: percent_1
  }

  measure: dq_120plus_account_rate {
    type: number
    sql: ${dq_120plus_accounts}/${total_open_accounts}
    value_format_name: percent_1 ;;
  }

  measure: dq_120plus_dollars {
    type: sum
    sql: ${dq_120plus_balance} ;
    value_format_name: percent_1;
  }

  measure: dq_120plus_dollar_rate {
    type: number
    sql: ${dq_120plus_balance}/${total_outstanding_balance} ;;
    value_format_name: percent_1
  }

  measure: dq_150plus_accounts {
    type: sum
    sql: ${dq_150plus_count} ;;
    value_format_name: percent_1
  }

  measure: dq_150plus_account_rate {
    type: number
    sql: ${dq_150plus_accounts}/${total_open_accounts} ;;
    value_format_name: percent_1
  }

  measure: dq_150plus_dollars {
    type: sum
    sql: ${dq_150plus_balance} ;;
    value_format_name: percent_1
  }

  measure: dq_150plus_dollar_rate {
    type: number
    sql: ${dq_150plus_balance}/${total_outstanding_balance} ;;
    value_format_name: percent_1
  }

  measure: dq_180plus_accounts {
    type: sum
    sql: ${dq_180plus_count} ;;
    value_format_name: percent_1
  }

  measure: dq_180plus_account_rate {
    type: number
    sql: ${dq_180plus_accounts}/${total_open_accounts} ;;
    value_format_name: percent_1
  }

  measure: dq_180plus_dollars {
    type: sum
    sql: ${dq_180plus_balance} ;;
    value_format_name: percent_1
  }

  measure: dq_180plus_dollar_rate {
    type: number
    sql: ${dq_180plus_balance}/${total_outstanding_balance} ;;
    value_format_name: percent_1
  }

  measure: dq_1_30_accounts {
    type: sum
    sql: ${dq_1_30_count} ;;
    value_format_name: percent_1
  }

  measure: dq_1_30_account_rate {
    type: number
    sql: ${dq_1_30_accounts}/${total_open_accounts} ;;
    value_format_name: percent_1
  }

  measure: dq_1_30_dollars {
    type: sum
    sql: ${dq_1_30_balance} ;;
    value_format_name: percent_1
  }

  measure: dq_1_30_dollar_rate {
    type: number
    sql: ${dq_1_30_balance}/${total_outstanding_balance} ;;
    value_format_name: percent_1
  }

  measure: dq_30_60_accounts {
    type: sum
    sql: ${dq_30_60_count} ;;
    value_format_name: percent_1
  }

  measure: dq_30_60_account_rate {
    type: number
    sql: ${dq_30_60_accounts}/${total_open_accounts} ;;
    value_format_name: percent_1
  }

  measure: dq_30_60_dollars {
    type: sum
    sql: ${dq_30_60_balance} ;;
    value_format_name: percent_1
  }

  measure: dq_30_60_dollar_rate {
    type: number
    sql: ${dq_30_60_balance}/${total_outstanding_balance} ;;
    value_format_name: percent_1
  }

  measure: dq_60_90_accounts {
    type: sum
    sql: ${dq_60_90_count} ;;
    value_format_name: percent_1
  }

  measure: dq_60_90_account_rate {
    type: number
    sql: ${dq_60_90_accounts}/${total_open_accounts} ;;
    value_format_name: percent_1
  }

  measure: dq_60_90_dollars {
    type: sum
    sql: ${dq_60_90_balance} ;;
    value_format_name: percent_1
  }

  measure: dq_60_90_dollar_rate {
    type: number
    sql: ${dq_60_90_balance}/${total_outstanding_balance} ;;
    value_format_name: percent_1
  }

  measure: dq_90_120_accounts {
    type: sum
    sql: ${dq_90_120_count} ;;
    value_format_name: percent_1
  }

  measure: dq_90_120_account_rate {
    type: number
    sql: ${dq_90_120_accounts}/${total_open_accounts} ;;
    value_format_name: percent_1
  }

  measure: dq_90_120_dollars {
    type: sum
    sql: ${dq_90_120_balance} ;;
    value_format_name: percent_1
  }

  measure: dq_90_120_dollar_rate {
    type: number
    sql: ${dq_90_120_balance}/${total_outstanding_balance} ;;
    value_format_name: percent_1
  }

  measure: dq_120_150_accounts {
    type: sum
    sql: ${dq_120_150_count} ;;
    value_format_name: percent_1
  }

  measure: dq_120_150_account_rate {
    type: number
    sql: ${dq_120_150_accounts}/${total_open_accounts} ;;
    value_format_name: percent_1
  }

  measure: dq_120_150_dollars {
    type: sum
    sql: ${dq_120_150_balance} ;;
    value_format_name: percent_1
  }

  measure: dq_120_150_dollar_rate {
    type: number
    sql: ${dq_120_150_balance}/${total_outstanding_balance} ;;
    value_format_name: percent_1
  }

  measure: dq_150_180_accounts {
    type: sum
    sql: ${dq_150_180_count} ;;
    value_format_name: percent_1
  }

  measure: dq_150_180_account_rate {
    type: number
    sql: ${dq_150_180_accounts}/${total_open_accounts} ;;
    value_format_name: percent_1
  }

  measure: dq_150_180_dollars {
    type: sum
    sql: ${dq_150_180_balance} ;;
    value_format_name: percent_1
  }

  measure: dq_150_180_dollar_rate {
    type: number
    sql: ${dq_150_180_balance}/${total_outstanding_balance} ;;
    value_format_name: percent_1
  }

}
