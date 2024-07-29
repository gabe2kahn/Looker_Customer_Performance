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

  dimension_group: closed_chargeoff {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(COALESCE(${TABLE}."CHARGEOFF_DATE",${TABLE}."ACCOUNT_CLOSED_DATE") AS TIMESTAMP_NTZ) ;;
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

  dimension: days_in_snap_month {
    type: number
    sql: DAY(DATEADD(day,-1,DATEADD(months,1,DATE_TRUNC('MONTH',${TABLE}."SNAP_DATE")))) ;; #needs to reference original table
  }

  dimension: day_of_snap_month {
    type: number
    sql: DAY(${TABLE}."SNAP_DATE") ;; #needs to reference original table
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

  dimension: outstanding_balance_principal {
    type: number
    sql: ${TABLE}."OUTSTANDING_BALANCE_PRINCIPAL" ;;
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

  dimension: recoveries {
    type: number
    sql: ${TABLE}."RECOVERIES" ;;
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

  dimension: snap_order {
    type: number
    sql: ${TABLE}."SNAP_ORDER" ;;
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

  measure: closed_users {
    type: count_distinct
    sql: CASE WHEN ${account_closed_date} IS NOT NULL and ${chargeoff_date} IS NULL THEN ${user_id} END;;
  }

  measure: charged_off_users {
    type: count_distinct
    sql: CASE WHEN ${gaco} > 0 THEN ${user_id} END;;
  }

  measure: current_users {
    type: count_distinct
    sql: CASE
      WHEN ${overdue_ind} = 'False'
        and ${chargeoff_date} IS NULL
        and ${account_closed_date} IS NULL
      THEN ${user_id}
    END ;;
  }

  measure: current_users_with_due_date {
    type: count_distinct
    sql: CASE
      WHEN ${overdue_ind} = 'False'
        and ${chargeoff_date} IS NULL
        and ${account_closed_date} IS NULL
        and ${most_recent_due_date} IS NOT NULL
      THEN ${user_id}
    END ;;
  }

  measure: overdue_users {
    type: count_distinct
    sql: CASE
      WHEN ${overdue_ind} = 'True'
        and ${outstanding_balance} > 5
        and ${chargeoff_date} IS NULL
      THEN ${user_id}
    END ;;
  }

  measure: overdue_or_chargeoff_users {
    type: count_distinct
    sql: CASE
      WHEN ${overdue_ind} = 'True'
        and ${outstanding_balance} > 5
      THEN ${user_id}
    END ;;
  }

  measure: dq30plus_users {
    type: count_distinct
    sql: CASE
      WHEN ${overdue_ind} = 'True'
        and ${days_overdue} >= 30
        and ${outstanding_balance} > 5
        and ${chargeoff_date} IS NULL
      THEN ${user_id}
    END ;;
  }

  measure: dq30plus_or_chargeoff_users {
    type: count_distinct
    sql: CASE
      WHEN ${overdue_ind} = 'True'
        and ${days_overdue} >= 30
        and ${outstanding_balance} > 5
      THEN ${user_id}
    END ;;
  }

  measure: dq60plus_users {
    type: count_distinct
    sql: CASE
      WHEN ${overdue_ind} = 'True'
        and ${days_overdue} >= 60
        and ${outstanding_balance} > 5
        and ${chargeoff_date} IS NULL
      THEN ${user_id}
    END ;;
  }

  measure: dq60plus_or_chargeoff_users {
    type: count_distinct
    sql: CASE
      WHEN ${overdue_ind} = 'True'
        and ${days_overdue} >= 60
        and ${outstanding_balance} > 5
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

  measure: dq90plus_or_chargeoff_users {
    type: count_distinct
    sql: CASE
      WHEN ${overdue_ind} = 'True'
        and ${days_overdue} >= 90
        and ${outstanding_balance} > 5
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
      THEN ${outstanding_balance_principal}
    END ;;
  }

  measure: overdue_or_chargeoff_balance {
    type: sum
    sql: CASE
      WHEN ${overdue_ind} = 'True'
      THEN ${outstanding_balance_principal}
    END ;;
  }

  measure: dq30plus_balance {
    type: sum
    sql: CASE
      WHEN ${overdue_ind} = 'True'
        and ${days_overdue} >= 30
        and ${chargeoff_date} IS NULL
      THEN ${outstanding_balance_principal}
      END ;;
  }

  measure: dq30plus_or_chargeoff_balance {
    type: sum
    sql: CASE
      WHEN ${overdue_ind} = 'True'
        and ${days_overdue} >= 30
      THEN ${outstanding_balance_principal}
      END ;;
  }

  measure: dq60plus_balance {
    type: sum
    sql: CASE
      WHEN ${overdue_ind} = 'True'
        and ${days_overdue} >= 60
        and ${chargeoff_date} IS NULL
      THEN ${outstanding_balance_principal}
      END ;;
  }

  measure: dq60plus_or_chargeoff_balance {
    type: sum
    sql: CASE
      WHEN ${overdue_ind} = 'True'
        and ${days_overdue} >= 60
      THEN ${outstanding_balance_principal}
      END ;;
  }

  measure: dq90plus_balance {
    type: sum
    sql: CASE
      WHEN ${overdue_ind} = 'True'
        and ${days_overdue} >= 90
        and ${chargeoff_date} IS NULL
      THEN ${outstanding_balance_principal}
      END ;;
  }

  measure: dq90plus_or_chargeoff_balance {
    type: sum
    sql: CASE
      WHEN ${overdue_ind} = 'True'
        and ${days_overdue} >= 90
      THEN ${outstanding_balance_principal}
      END ;;
  }

  measure: policy_20230929_approved_overdue_balance {
    type: sum
    sql: CASE
      WHEN ${overdue_ind} = 'True'
        AND ${user_profile.policy_20230929_approval_ind} = 'Approved'
        and ${chargeoff_date} IS NULL
      THEN ${outstanding_balance_principal}
    END ;;
  }

  measure: policy_20230929_approved_dq30plus_balance {
    type: sum
    sql: CASE
      WHEN ${overdue_ind} = 'True'
        and ${days_overdue} >= 30
        AND ${user_profile.policy_20230929_approval_ind} = 'Approved'
        and ${chargeoff_date} IS NULL
      THEN ${outstanding_balance_principal} END ;;
  }

  measure: policy_20240117_approved_overdue_balance {
    type: sum
    sql: CASE
      WHEN ${overdue_ind} = 'True'
        AND ${user_profile.policy_20240117_approval_ind} = 'Approved'
        and ${chargeoff_date} IS NULL
      THEN ${outstanding_balance_principal}
    END ;;
  }

  measure: policy_20240117_approved_dq30plus_balance {
    type: sum
    sql: CASE
      WHEN ${overdue_ind} = 'True'
        and ${days_overdue} >= 30
        AND ${user_profile.policy_20240117_approval_ind} = 'Approved'
        and ${chargeoff_date} IS NULL
      THEN ${outstanding_balance_principal}
    END ;;
  }

  measure: overdue_rate {
    type: number
    sql: ${overdue_users} / NULLIF(${open_users},0) ;;
    value_format_name: percent_1
  }

  measure: overdue_or_chargeoff_rate {
    type: number
    sql: ${overdue_or_chargeoff_users} / NULLIF(${open_users} + ${charged_off_users},0) ;;
    value_format_name: percent_1
  }

  measure: dq30plus_rate {
    type: number
    sql: ${dq30plus_users} / NULLIF(${open_users},0) ;;
    value_format_name: percent_1
  }

  measure: dq30plus_or_chargeoff_rate {
    type: number
    sql: ${dq30plus_or_chargeoff_users} / NULLIF(${open_users} + ${charged_off_users},0) ;;
    value_format_name: percent_1
  }

  measure: dq60plus_rate {
    type: number
    sql: ${dq60plus_users} / NULLIF(${open_users},0) ;;
    value_format_name: percent_1
  }

  measure: dq60plus_or_chargeoff_rate {
    type: number
    sql: ${dq60plus_or_chargeoff_users} / NULLIF(${open_users} + ${charged_off_users},0) ;;
    value_format_name: percent_1
  }

  measure: dq90plus_rate {
    type: number
    sql: ${dq90plus_users} / NULLIF(${open_users},0) ;;
    value_format_name: percent_1
  }

  measure: dq90plus_or_chargeoff_rate {
    type: number
    sql: ${dq90plus_or_chargeoff_users} / NULLIF(${open_users} + ${charged_off_users},0) ;;
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

  measure: overdue_or_chargeoff_dollar_rate {
    type: number
    sql: ${overdue_or_chargeoff_balance} / NULLIF(${total_principal_outstandings_with_chargeoffs},0) ;;
    value_format_name: percent_1
  }

  measure: dq30plus_dollar_rate {
    type: number
    sql: ${dq30plus_balance} / NULLIF(${total_outstandings},0) ;;
    value_format_name: percent_1
  }

  measure: dq30plus_or_chargeoff_dollar_rate {
    type: number
    sql: ${dq30plus_or_chargeoff_balance} / NULLIF(${total_principal_outstandings_with_chargeoffs},0) ;;
    value_format_name: percent_1
  }

  measure: dq60plus_dollar_rate {
    type: number
    sql: ${dq60plus_balance} / NULLIF(${total_outstandings},0) ;;
    value_format_name: percent_1
  }

  measure: dq60plus_or_chargeoff_dollar_rate {
    type: number
    sql: ${dq60plus_or_chargeoff_balance} / NULLIF(${total_principal_outstandings_with_chargeoffs},0) ;;
    value_format_name: percent_1
  }

  measure: dq90plus_dollar_rate {
    type: number
    sql: ${dq90plus_balance} / NULLIF(${total_outstandings},0) ;;
    value_format_name: percent_1
  }

  measure: dq90plus_or_chargeoff_dollar_rate {
    type: number
    sql: ${dq90plus_or_chargeoff_balance} / NULLIF(${total_principal_outstandings_with_chargeoffs},0) ;;
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

  measure: total_principal_outstandings {
    type: sum
    sql: CASE WHEN ${chargeoff_date} IS NULL THEN ${outstanding_balance_principal} END;;
    value_format_name: usd
  }

  measure: total_outstandings_with_chargeoffs{
    type: sum
    sql: ${outstanding_balance} ;;
    value_format_name: usd
  }

  measure: total_principal_outstandings_with_chargeoffs{
    type: sum
    sql: ${outstanding_balance_principal} ;;
    value_format_name: usd
  }

  measure: average_outstandings {
    type: number
    sql: SUM(${outstanding_balance})/${open_users} ;;
    value_format_name: usd_0
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

  measure: total_guco {
    type: sum
    sql: ${guco} ;;
    value_format_name: usd
  }

  measure: total_gaco {
    type: sum
    sql: ${gaco} ;;
    value_format_name: usd
  }

  measure: total_recoveries {
    type: sum
    sql: ${recoveries} ;;
    value_format_name: usd
  }

  measure: total_nuco {
    type: number
    sql: ${total_guco} - ${total_recoveries} ;;
    value_format_name: usd
  }

  measure: total_naco {
    type: number
    sql: ${total_gaco} - ${total_recoveries} ;;
    value_format_name: usd
  }

  measure: average_credit_limit {
    type: number
    sql: SUM(${current_credit_limit})/${open_users} ;;
    value_format_name: usd_0
  }

  measure: average_utilization {
    type: average
    sql: ${credit_utilization};;
    value_format_name: percent_1
  }

  measure: average_purchase_volume {
    type: number
    sql: SUM(${purchase_volume})/${open_users} ;;
    value_format_name: usd
  }

  measure: total_purchase_volume {
    type: number
    sql: SUM(${purchase_volume}) ;;
    value_format_name: usd
  }

  measure: average_payment_volume {
    type: number
    sql: ${payments.successful_payment_amount}/${open_users} ;;
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

  measure: days_in_month {
    type: max
    sql: ${days_in_snap_month} ;;
  }

  measure: annualized_nuco_rate {
    type: number
    sql: (sum(${guco}) - sum(${recoveries}))*12/(sum(${outstanding_balance})/${days_in_month}) ;;
    value_format_name: percent_1
  }

  measure: annualized_naco_rate {
    type: number
    sql: (sum(${gaco}) - sum(${recoveries}))*12/(sum(${outstanding_balance})/${days_in_month}) ;;
    value_format_name: percent_1
  }

  measure: chargeoff_severity {
    type: number
    sql: SUM(${gaco})/NULLIF(${charged_off_users},0) ;;
    value_format_name: usd
  }

  measure: principal_balance_per_current {
    type: number
    sql: SUM(CASE
        WHEN ${days_overdue} = 0
          AND ${chargeoff_date} IS NULL
          AND ${account_closed_date} IS NULL
          AND ${most_recent_due_date} IS NOT NULL
        THEN ${outstanding_balance_principal} END)/
     ${current_users_with_due_date} ;;
    value_format_name: usd
  }

  measure: principal_balance_per_dq30plus {
    type: number
    sql: SUM(CASE WHEN ${days_overdue} >= 30
        and ${outstanding_balance} > 5
        and ${chargeoff_date} IS NULL
      THEN ${outstanding_balance_principal} END)/
    ${dq30plus_users} ;;
    value_format_name: usd
  }

  measure: principal_balance_per_dq60plus {
    type: number
    sql: SUM(CASE WHEN ${days_overdue} >= 60
        and ${outstanding_balance} > 5
        and ${chargeoff_date} IS NULL
      THEN ${outstanding_balance_principal} END)/
      ${dq60plus_users} ;;
    value_format_name: usd
  }

  measure: cl_per_current {
    type: number
    sql: SUM(CASE
      WHEN ${days_overdue} = 0
        AND ${chargeoff_date} IS NULL
        AND ${account_closed_date} IS NULL
        AND ${most_recent_due_date} IS NOT NULL
      THEN ${current_credit_limit} END)/
      ${current_users_with_due_date} ;;
    value_format_name: usd
  }

  measure: cl_per_dq30plus {
    type: number
    sql: SUM(CASE
      WHEN ${days_overdue} >= 30
        and ${outstanding_balance} > 5
        and ${chargeoff_date} IS NULL
      THEN ${current_credit_limit} END)/
      ${dq30plus_users} ;;
    value_format_name: usd
  }

  measure: cl_per_dq60plus {
    type: number
    sql: SUM(CASE WHEN ${days_overdue} >= 60
        and ${outstanding_balance} > 5
        and ${chargeoff_date} IS NULL
      THEN ${current_credit_limit} END)/
      ${dq60plus_users} ;;
    value_format_name: usd
  }

  measure: current_cl_to_dq30plus_cl_ratio {
    type: number
    sql: ${cl_per_current}/ ${cl_per_dq30plus} ;;
    value_format_name: decimal_2
  }

  measure: current_cl_to_dq60plus_cl_ratio {
    type: number
    sql: ${cl_per_current}/ ${cl_per_dq60plus} ;;
    value_format_name: decimal_2
  }

  measure: current_balance_to_dq30plus_balance_ratio {
    type: number
    sql: ${principal_balance_per_current}/ ${principal_balance_per_dq30plus} ;;
    value_format_name: decimal_2
  }

  measure: current_balance_to_dq60plus_balance_ratio {
    type: number
    sql: ${principal_balance_per_current}/ ${principal_balance_per_dq60plus} ;;
    value_format_name: decimal_2
  }

# Roll and Cure Rate Measures

  measure: dq1_users {
    type: count_distinct
    sql: CASE
      WHEN ${overdue_ind} = 'True'
        and ${days_overdue} between 1 and 30
        and ${chargeoff_date} IS NULL
      THEN ${user_id}
    END ;;
  }

  measure: dq2_users {
    type: count_distinct
    sql: CASE
      WHEN ${overdue_ind} = 'True'
        and ${days_overdue} between 31 and 60
        and ${chargeoff_date} IS NULL
      THEN ${user_id}
    END ;;
  }

  measure: dq3_users {
    type: count_distinct
    sql: CASE
      WHEN ${overdue_ind} = 'True'
        and ${days_overdue} between 61 and 90
        and ${chargeoff_date} IS NULL
      THEN ${user_id}
    END ;;
  }

  measure: dq4_users {
    type: count_distinct
    sql: CASE
      WHEN ${overdue_ind} = 'True'
        and ${days_overdue} between 91 and 120
        and ${chargeoff_date} IS NULL
      THEN ${user_id}
    END ;;
  }

  measure: dq5_users {
    type: count_distinct
    sql: CASE
      WHEN ${overdue_ind} = 'True'
        and ${days_overdue} between 121 and 150
        and ${chargeoff_date} IS NULL
      THEN ${user_id}
    END ;;
  }

  measure: dq6_users {
    type: count_distinct
    sql: CASE
      WHEN ${overdue_ind} = 'True'
        and ${days_overdue} between 151 and 179
        and ${chargeoff_date} IS NULL
      THEN ${user_id}
    END ;;
  }

  measure: Dq0_1_roll_users {
    type: count_distinct
    sql: CASE
      WHEN ${days_overdue} = 0
        AND ${next_month_snapshot.days_overdue} > 0
        and ${chargeoff_date} IS NULL
      THEN ${user_id}
    END ;;
  }

  measure: Dq1_2_roll_users {
    type: count_distinct
    sql: CASE
      WHEN ${days_overdue} between 1 and 30
        AND ${next_month_snapshot.days_overdue} > 30
        AND ${overdue_ind} = 'True'
        and ${chargeoff_date} IS NULL
      THEN ${user_id}
    END ;;
  }

  measure: Dq2_3_roll_users {
    type: count_distinct
    sql: CASE
      WHEN ${days_overdue} between 31 and 60
        AND ${next_month_snapshot.days_overdue} > 60
        AND ${overdue_ind} = 'True'
        and ${chargeoff_date} IS NULL
      THEN ${user_id}
    END ;;
  }

  measure: Dq3_4_roll_users {
    type: count_distinct
    sql: CASE
      WHEN ${days_overdue} between 61 and 90
        AND ${next_month_snapshot.days_overdue} > 90
        AND ${overdue_ind} = 'True'
        and ${chargeoff_date} IS NULL
      THEN ${user_id}
    END ;;
  }

  measure: Dq4_5_roll_users {
    type: count_distinct
    sql: CASE
      WHEN ${days_overdue} between 91 and 120
        AND ${next_month_snapshot.days_overdue} > 120
        AND ${overdue_ind} = 'True'
        and ${chargeoff_date} IS NULL
      THEN ${user_id}
    END ;;
  }

  measure: Dq5_6_roll_users {
    type: count_distinct
    sql: CASE
      WHEN ${days_overdue} between 121 and 150
        AND ${next_month_snapshot.days_overdue} > 150
        AND ${overdue_ind} = 'True'
        and ${chargeoff_date} IS NULL
      THEN ${user_id}
    END ;;
  }

  measure: Dq6_co_roll_users {
    type: count_distinct
    sql: CASE
      WHEN ${days_overdue} between 151 and 179
        AND ${next_month_snapshot.days_overdue} >= 180
        AND ${overdue_ind} = 'True'
        and ${chargeoff_date} IS NULL
      THEN ${user_id}
    END ;;
  }

  measure: dq0_1_roll_rate {
    type: number
    sql: ${Dq0_1_roll_users}/NULLIF(${current_users},0) ;;
    value_format_name: percent_1
  }

  measure: dq1_2_roll_rate {
    type: number
    sql: ${Dq1_2_roll_users}/NULLIF(${dq1_users},0) ;;
    value_format_name: percent_1
  }

 measure: dq2_3_roll_rate {
    type: number
    sql: ${Dq2_3_roll_users}/NULLIF(${dq2_users},0) ;;
    value_format_name: percent_1
  }

  measure: dq3_4_roll_rate {
    type: number
    sql: ${Dq3_4_roll_users}/NULLIF(${dq3_users},0) ;;
    value_format_name: percent_1
  }

  measure: dq4_5_roll_rate {
    type: number
    sql: ${Dq4_5_roll_users}/NULLIF(${dq4_users},0) ;;
    value_format_name: percent_1
  }

  measure: dq5_6_roll_rate {
    type: number
    sql: ${Dq5_6_roll_users}/NULLIF(${dq5_users},0) ;;
    value_format_name: percent_1
  }

  measure: dq6_co_roll_rate {
    type: number
    sql: ${Dq6_co_roll_users}/NULLIF(${dq6_users},0) ;;
    value_format_name: percent_1
  }

  measure: Dq1_cure_users {
    type: count_distinct
    sql: CASE
      WHEN ${days_overdue} between 1 and 30
        AND ${next_month_snapshot.days_overdue} = 0
      THEN ${user_id}
    END ;;
  }

  measure: Dq2_cure_users {
    type: count_distinct
    sql: CASE
      WHEN ${days_overdue} between 31 and 60
        AND ${next_month_snapshot.days_overdue} = 0
      THEN ${user_id}
    END ;;
  }

  measure: Dq3_cure_users {
    type: count_distinct
    sql: CASE
      WHEN ${days_overdue} between 61 and 90
        AND ${next_month_snapshot.days_overdue} = 0
      THEN ${user_id}
    END ;;
  }

  measure: Dq4_cure_users {
    type: count_distinct
    sql: CASE
      WHEN ${days_overdue} between 91 and 120
        AND ${next_month_snapshot.days_overdue} = 0
      THEN ${user_id}
    END ;;
  }

  measure: Dq5_cure_users {
    type: count_distinct
    sql: CASE
      WHEN ${days_overdue} between 121 and 150
        AND ${next_month_snapshot.days_overdue} = 0
      THEN ${user_id}
    END ;;
  }

  measure: Dq6_cure_users {
    type: count_distinct
    sql: CASE
      WHEN ${days_overdue} between 151 and 179
        AND ${next_month_snapshot.days_overdue} = 0
      THEN ${user_id}
    END ;;
  }

  measure: dq1_cure_rate {
    type: number
    sql: ${Dq1_cure_users}/NULLIF(${dq1_users},0) ;;
    value_format_name: percent_1
  }

  measure: dq2_cure_rate {
    type: number
    sql: ${Dq2_cure_users}/NULLIF(${dq2_users},0) ;;
    value_format_name: percent_1
  }

  measure: dq3_cure_rate {
    type: number
    sql: ${Dq3_cure_users}/NULLIF(${dq3_users},0) ;;
    value_format_name: percent_1
  }

  measure: dq4_cure_rate {
    type: number
    sql: ${Dq4_cure_users}/NULLIF(${dq4_users},0) ;;
    value_format_name: percent_1
  }

  measure: dq5_cure_rate {
    type: number
    sql: ${Dq5_cure_users}/NULLIF(${dq5_users},0) ;;
    value_format_name: percent_1
  }

  measure: dq6_cure_rate {
    type: number
    sql: ${Dq6_cure_users}/NULLIF(${dq6_users},0) ;;
    value_format_name: percent_1
  }

  measure: median_time_since_approval {
    type: number
    sql: MEDIAN(${snap_order}) ;;
    value_format_name: decimal_1
  }

}
