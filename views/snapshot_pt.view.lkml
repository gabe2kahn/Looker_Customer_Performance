view: snapshot_pt {
  sql_table_name: "CUSTOMER"."SNAPSHOT_PT" ;;

  dimension_group: account_closed {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}."ACCOUNT_CLOSED_DATE" ;;
  }

  dimension: active_level {
    type: string
    sql: ${TABLE}."ACTIVE_LEVEL" ;;
  }

  dimension: autopay_on_ind {
    type: yesno
    sql: ${TABLE}."AUTOPAY_ON_IND" ;;
  }

  dimension: autopay_type {
    type: string
    sql: ${TABLE}."AUTOPAY_TYPE" ;;
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
  dimension: days_overdue {
    type: number
    sql: ${TABLE}."DAYS_OVERDUE" ;;
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

  dimension: fee_only_overdue_ind {
    type: yesno
    sql: ${overdue_ind} = 'TRUE' AND ${outstanding_balance} <= 5 ;;
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

  dimension_group: most_recent_due {
    type: time
    timeframes: [date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."MOST_RECENT_DUE_DATE" ;;
  }

  dimension_group: next_due {
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
  dimension: peach_data_id {
    type: number
    sql: ${TABLE}."PEACH_DATA_ID" ;;
  }
  dimension: peach_loan_id {
    type: string
    sql: ${TABLE}."PEACH_LOAN_ID" ;;
  }

  dimension: primary_key {
    type: string
    primary_key: yes
    sql: ${user_id}||${snap_date} ;;
  }

  dimension: purchase_volume {
    type: number
    sql: ${TABLE}."PURCHASE_VOLUME" ;;
  }

  dimension_group: snap {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."SNAP_DATE" ;;
  }
  dimension: snap_recency {
    type: number
    sql: ${TABLE}."SNAP_RECENCY" ;;
  }
  dimension: total_delinq_balance {
    type: number
    sql: ${TABLE}."TOTAL_DELINQ_BALANCE" ;;
  }


  dimension: user_id {
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: users {
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: policy_20230929_approved_users {
    type: count_distinct
    sql: CASE WHEN ${user_profile.policy_20230929_approval_ind} = 'Approved' THEN ${user_id} END ;;
  }

  measure: policy_20240117_approved_users {
    type: count_distinct
    sql: CASE WHEN ${user_profile.policy_20240117_approval_ind} = 'Approved' THEN ${user_id} END ;;
  }

  measure: open_users {
    type: count_distinct
    sql: CASE WHEN ${account_closed_date} IS NULL and ${chargeoff_date} IS NULL THEN ${user_id} END;;
  }

  measure: overdue_users {
    type: count_distinct
    sql: CASE
      WHEN ${overdue_ind} = 'True'
        and ${chargeoff_date} IS NULL
      THEN ${user_id}
    END ;;
  }

  measure: dq30plus_users {
    type: count_distinct
    sql: CASE
      WHEN ${overdue_ind} = 'True'
        and ${days_overdue} >= 30
        and ${chargeoff_date} IS NULL
      THEN ${user_id}
    END ;;
  }

  measure: dq60plus_users {
    type: count_distinct
    sql: CASE
      WHEN ${overdue_ind} = 'True'
        and ${days_overdue} >= 60
        and ${chargeoff_date} IS NULL
      THEN ${user_id}
    END ;;
  }

  measure: dq90plus_users {
    type: count_distinct
    sql: CASE
      WHEN ${overdue_ind} = 'True'
        and ${days_overdue} >= 90
        and ${chargeoff_date} IS NULL
      THEN ${user_id}
    END ;;
  }

  measure: dq30_59_users {
    type: count_distinct
    sql: CASE
      WHEN ${overdue_ind} = 'True'
        and ${days_overdue} between 30 and 59
        and ${chargeoff_date} IS NULL
      THEN ${user_id}
    END ;;
  }

  measure: policy_20230929_approved_overdue_users {
    type: count_distinct
    sql: CASE
      WHEN ${overdue_ind} = 'True'
        and ${chargeoff_date} IS NULL
        AND ${user_profile.policy_20230929_approval_ind} = 'Approved'
      THEN ${user_id}
    END ;;
  }

  measure: policy_20240117_approved_overdue_users {
    type: count_distinct
    sql: CASE
      WHEN ${overdue_ind} = 'True'
        and ${chargeoff_date} IS NULL
        AND ${user_profile.policy_20240117_approval_ind} = 'Approved'
      THEN ${user_id}
    END ;;
  }

  measure: overdue_balance {
    type: sum
    sql: CASE
      WHEN ${overdue_ind} = 'True'
        and ${chargeoff_date} IS NULL
      THEN ${outstanding_balance}
    END ;;
  }

  measure: dq30plus_balance {
    type: sum
    sql: CASE
      WHEN ${overdue_ind} = 'True'
        and ${days_overdue} >= 30
        and ${chargeoff_date} IS NULL
      THEN ${outstanding_balance}
      END ;;
  }

  measure: policy_20230929_approved_overdue_balance {
    type: sum
    sql: CASE
      WHEN ${overdue_ind} = 'True'
        AND ${user_profile.policy_20230929_approval_ind} = 'Approved'
        and ${chargeoff_date} IS NULL
      THEN ${outstanding_balance}
    END ;;
  }

  measure: policy_20230929_approved_dq30plus_balance {
    type: sum
    sql: CASE
      WHEN ${overdue_ind} = 'True'
        and ${days_overdue} >= 30
        AND ${user_profile.policy_20230929_approval_ind} = 'Approved'
        and ${chargeoff_date} IS NULL
      THEN ${outstanding_balance} END ;;
  }

  measure: policy_20240117_approved_overdue_balance {
    type: sum
    sql: CASE
      WHEN ${overdue_ind} = 'True'
        AND ${user_profile.policy_20240117_approval_ind} = 'Approved'
        and ${chargeoff_date} IS NULL
      THEN ${outstanding_balance}
    END ;;
  }

  measure: policy_20240117_approved_dq30plus_balance {
    type: sum
    sql: CASE
      WHEN ${overdue_ind} = 'True'
        and ${days_overdue} >= 30
        AND ${user_profile.policy_20240117_approval_ind} = 'Approved'
        and ${chargeoff_date} IS NULL
      THEN ${outstanding_balance}
    END ;;
  }

  measure: overdue_rate {
    type: number
    sql: ${overdue_users} / NULLIF(${users},0) ;;
    value_format_name: percent_1
  }

  measure: dq30plus_rate {
    type: number
    sql: ${dq30plus_users} / NULLIF(${users},0) ;;
    value_format_name: percent_1
  }

  measure: dq60plus_rate {
    type: number
    sql: ${dq60plus_users} / NULLIF(${users},0) ;;
    value_format_name: percent_1
  }

  measure: dq90plus_rate {
    type: number
    sql: ${dq90plus_users} / NULLIF(${users},0) ;;
    value_format_name: percent_1
  }

  measure: dq30_59_rate {
    type: number
    sql: ${dq30_59_users} / NULLIF(${users},0) ;;
    value_format_name: percent_1
  }

  measure: policy_20230929_approved_overdue_rate {
    type: number
    sql: ${policy_20230929_approved_overdue_users} / NULLIF(${policy_20230929_approved_users},0) ;;
    value_format_name: percent_1
  }

  measure: policy_20240117_approved_overdue_rate {
    type: number
    sql: ${policy_20240117_approved_overdue_users} / NULLIF(${policy_20240117_approved_users},0) ;;
    value_format_name: percent_1
  }

  measure: overdue_dollar_rate {
    type: number
    sql: ${overdue_balance} / NULLIF(${total_outstandings},0) ;;
    value_format_name: percent_1
  }

  measure: dq30plus_dollar_rate {
    type: number
    sql: ${dq30plus_balance} / NULLIF(${total_outstandings},0) ;;
    value_format_name: percent_1
  }

  measure: policy_20230929_approved_overdue_dollar_rate {
    type: number
    sql: ${policy_20230929_approved_overdue_balance} / NULLIF(${policy_20230929_approved_total_outstandings},0) ;;
    value_format_name: percent_1
  }

  measure: policy_20230929_approved_dq30plus_dollar_rate {
    type: number
    sql: ${policy_20230929_approved_dq30plus_balance} / NULLIF(${policy_20230929_approved_total_outstandings},0) ;;
    value_format_name: percent_1
  }

  measure: policy_20240117_approved_overdue_dollar_rate {
    type: number
    sql: ${policy_20240117_approved_overdue_balance} / NULLIF(${policy_20240117_approved_total_outstandings},0) ;;
    value_format_name: percent_1
  }

  measure: policy_20240117_approved_dq30plus_dollar_rate {
    type: number
    sql: ${policy_20240117_approved_dq30plus_balance} / NULLIF(${policy_20240117_approved_total_outstandings},0) ;;
    value_format_name: percent_1
  }

  measure: total_outstandings {
    type: sum
    sql: CASE WHEN ${chargeoff_date} IS NULL THEN ${outstanding_balance} END;;
    value_format_name: usd
  }

  measure: policy_20230929_approved_total_outstandings {
    type: sum
    sql: CASE
      WHEN ${user_profile.policy_20230929_approval_ind} = 'Approved'
        and ${chargeoff_date} IS NULL
      THEN ${outstanding_balance}
    END ;;
    value_format_name: usd
  }

  measure: policy_20240117_approved_total_outstandings {
    type: sum
    sql: CASE
      WHEN ${user_profile.policy_20240117_approval_ind} = 'Approved'
        and ${chargeoff_date} IS NULL
      THEN ${outstanding_balance}
    END ;;
    value_format_name: usd
  }

  measure: total_exposure {
    type: sum
    sql: CASE
      WHEN ${account_closed_date} IS NULL
        and ${chargeoff_date} IS NULL
      THEN ${current_credit_limit}
    END;;
    value_format_name: usd_0
  }

  measure: average_credit_limit {
    type: average
    sql: CASE
      WHEN ${account_closed_date} IS NULL
        and ${chargeoff_date} IS NULL
      THEN ${current_credit_limit}
    END ;;
    value_format_name: usd_0
  }

  measure: average_utilization {
    type: average
    sql: ${credit_utilization};;
    value_format_name: percent_1
  }

  measure: average_purchase_volume {
    type: average
    sql: CASE
      WHEN ${account_closed_date} IS NULL
        and ${chargeoff_date} IS NULL
      THEN ${purchase_volume}
    END;;
    value_format_name: usd
  }

  measure: total_revenue {
    type: number
    sql: ${adjustment.membership_fee_revenue} + ${adjustment.late_fee_revenue} + ${adjustment.interest_revenue} +
      ${settlement.interchange} ;;
    value_format_name: usd
  }

  measure: total_revenue_per_open_user {
    type: number
    sql: ${total_revenue} / ${open_users} ;;
    value_format_name: usd
  }

  measure: membership_fee_revenue_per_open_user {
    type: number
    sql: ${adjustment.membership_fee_revenue} / ${open_users} ;;
    value_format_name: usd
  }

  measure: late_fee_revenue_per_open_user {
    type: number
    sql: ${adjustment.late_fee_revenue} / ${open_users} ;;
    value_format_name: usd
  }

  measure: interest_revenue_per_open_user {
    type: number
    sql: ${adjustment.interest_revenue} / ${open_users} ;;
    value_format_name: usd
  }

  measure: interchange_per_open_user {
    type: number
    sql: ${settlement.interchange} / ${open_users} ;;
    value_format_name: usd
  }
}
