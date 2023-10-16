view: arro_risk_model_1_summary {
  sql_table_name: "APPLICATION"."ARRO_RISK_MODEL_1_SUMMARY" ;;

  dimension: age_newest_bankcard_trade {
    type: number
    sql: ${TABLE}."AGE_NEWEST_BANKCARD_TRADE" ;;
  }
  dimension: age_newest_dep_store_trade {
    type: number
    sql: ${TABLE}."AGE_NEWEST_DEP_STORE_TRADE" ;;
  }
  dimension: age_newest_trade {
    type: number
    sql: ${TABLE}."AGE_NEWEST_TRADE" ;;
  }
  dimension: age_oldest_bankcard_trade {
    type: number
    sql: ${TABLE}."AGE_OLDEST_BANKCARD_TRADE" ;;
  }
  dimension: application_recency {
    type: number
    sql: ${TABLE}."APPLICATION_RECENCY" ;;
  }
  dimension_group: application_start_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."APPLICATION_START_TS" AS TIMESTAMP_NTZ) ;;
  }
  dimension: arro_risk_model_1_score {
    type: number
    sql: ${TABLE}."ARRO_RISK_MODEL_1_SCORE" ;;
  }
  dimension: avg_salary_income_txn {
    type: number
    sql: ${TABLE}."AVG_SALARY_INCOME_TXN" ;;
  }
  dimension: avg_utilities_expense_txn {
    type: number
    sql: ${TABLE}."AVG_UTILITIES_EXPENSE_TXN" ;;
  }
  dimension: count_asset_deposit_txn {
    type: number
    sql: ${TABLE}."COUNT_ASSET_DEPOSIT_TXN" ;;
  }
  dimension: count_neg_bal_occ_0_180 {
    type: number
    sql: ${TABLE}."COUNT_NEG_BAL_OCC_0_180" ;;
  }
  dimension: count_neg_bal_occ_0_30 {
    type: number
    sql: ${TABLE}."COUNT_NEG_BAL_OCC_0_30" ;;
  }
  dimension: count_rent_expense_txn_0_365 {
    type: number
    sql: ${TABLE}."COUNT_RENT_EXPENSE_TXN_0_365" ;;
  }
  dimension: count_telecom_expense_txn_0_30 {
    type: number
    sql: ${TABLE}."COUNT_TELECOM_EXPENSE_TXN_0_30" ;;
  }
  dimension: discharged_bankrupty {
    type: number
    sql: ${TABLE}."DISCHARGED_BANKRUPTY" ;;
  }
  dimension_group: last_status_update_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."LAST_STATUS_UPDATE_TS" AS TIMESTAMP_NTZ) ;;
  }
  dimension_group: last_update_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."LAST_UPDATE_TS" ;;
  }
  dimension: num_30_d_past_due_24_m {
    type: number
    sql: ${TABLE}."NUM_30D_PAST_DUE_24M" ;;
  }
  dimension: num_60_plusd_past_due_24_m {
    type: number
    sql: ${TABLE}."NUM_60PLUSD_PAST_DUE_24M" ;;
  }
  dimension: num_60_plusd_past_due_24_m_revolving {
    type: number
    sql: ${TABLE}."NUM_60PLUSD_PAST_DUE_24M_REVOLVING" ;;
  }
  dimension: num_inq_24_m {
    type: number
    sql: ${TABLE}."NUM_INQ_24M" ;;
  }
  dimension: num_inq_3_m {
    type: number
    sql: ${TABLE}."NUM_INQ_3M" ;;
  }
  dimension: num_mortgage_trades {
    type: number
    sql: ${TABLE}."NUM_MORTGAGE_TRADES" ;;
  }
  dimension: num_non_util_inq_6_m {
    type: number
    sql: ${TABLE}."NUM_NON_UTIL_INQ_6M" ;;
  }
  dimension: num_open_bankcard_trades_util_gte_75_pct {
    type: number
    sql: ${TABLE}."NUM_OPEN_BANKCARD_TRADES_UTIL_GTE_75PCT" ;;
  }
  dimension: num_open_credit_union_trades {
    type: number
    sql: ${TABLE}."NUM_OPEN_CREDIT_UNION_TRADES" ;;
  }
  dimension: num_open_mortgage_trades {
    type: number
    sql: ${TABLE}."NUM_OPEN_MORTGAGE_TRADES" ;;
  }
  dimension: num_revolving_trades_past_due_bal {
    type: number
    sql: ${TABLE}."NUM_REVOLVING_TRADES_PAST_DUE_BAL" ;;
  }
  dimension: num_trades_30_plusd_past_due {
    type: number
    sql: ${TABLE}."NUM_TRADES_30PLUSD_PAST_DUE" ;;
  }
  dimension: num_trades_past_due_balance {
    type: number
    sql: ${TABLE}."NUM_TRADES_PAST_DUE_BALANCE" ;;
  }
  dimension: num_trades_worst_6_m_30_d_past_due {
    type: number
    sql: ${TABLE}."NUM_TRADES_WORST_6M_30D_PAST_DUE" ;;
  }
  dimension: num_trades_worst_ever_60_plusd_past_due {
    type: number
    sql: ${TABLE}."NUM_TRADES_WORST_EVER_60PLUSD_PAST_DUE" ;;
  }
  dimension: num_unpaid_collections {
    type: number
    sql: ${TABLE}."NUM_UNPAID_COLLECTIONS" ;;
  }
  dimension: num_util_inq_6_m {
    type: number
    sql: ${TABLE}."NUM_UTIL_INQ_6M" ;;
  }
  dimension: pct_bal_past_due_all_trades {
    type: number
    sql: ${TABLE}."PCT_BAL_PAST_DUE_ALL_TRADES" ;;
  }
  dimension: pct_bankcard_to_tot_trades {
    type: number
    sql: ${TABLE}."PCT_BANKCARD_TO_TOT_TRADES" ;;
  }
  dimension: pct_good_revolving_trades_to_tot_revolving_trades {
    type: number
    sql: ${TABLE}."PCT_GOOD_REVOLVING_TRADES_TO_TOT_REVOLVING_TRADES" ;;
  }
  dimension: pct_revolving_to_tot_trades {
    type: number
    sql: ${TABLE}."PCT_REVOLVING_TO_TOT_TRADES" ;;
  }
  dimension: pct_revolving_trades_good_6_m_to_revolving_trades_6_m {
    type: number
    sql: ${TABLE}."PCT_REVOLVING_TRADES_GOOD_6M_TO_REVOLVING_TRADES_6M" ;;
  }
  dimension: pct_trades_good_6_m_to_tot_trades_6_m {
    type: number
    sql: ${TABLE}."PCT_TRADES_GOOD_6M_TO_TOT_TRADES_6M" ;;
  }
  dimension: pct_trades_opened_12_m_to_tot_trades {
    type: number
    sql: ${TABLE}."PCT_TRADES_OPENED_12M_TO_TOT_TRADES" ;;
  }
  dimension: pct_trades_worst_ever_60_plusd_past_due_to_tot_trades {
    type: number
    sql: ${TABLE}."PCT_TRADES_WORST_EVER_60PLUSD_PAST_DUE_TO_TOT_TRADES" ;;
  }
  dimension: pct_util_inq_12_m_to_inq_24_m {
    type: number
    sql: ${TABLE}."PCT_UTIL_INQ_12M_TO_INQ_24M" ;;
  }
  dimension_group: profile_creation_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."PROFILE_CREATION_TS" AS TIMESTAMP_NTZ) ;;
  }
  dimension: sm_cash_out_debt_ser {
    type: number
    sql: ${TABLE}."SM_CASH_OUT_DEBT_SER" ;;
  }
  dimension: sum_cash_outflow_transfers {
    type: number
    sql: ${TABLE}."SUM_CASH_OUTFLOW_TRANSFERS" ;;
  }
  dimension: sum_insurance_expense_txn {
    type: number
    sql: ${TABLE}."SUM_INSURANCE_EXPENSE_TXN" ;;
  }
  dimension: sum_salary_income_txn_0_365 {
    type: number
    sql: ${TABLE}."SUM_SALARY_INCOME_TXN_0_365" ;;
  }

  dimension: income_bucket {
    type: string
    sql: CASE
      WHEN ${sum_salary_income_txn_0_365} BETWEEN 0 AND 20000 THEN 'a. $0-$20K'
      WHEN ${sum_salary_income_txn_0_365} BETWEEN 20000 AND 50000 THEN 'b. $20K-$50K'
      WHEN ${sum_salary_income_txn_0_365} BETWEEN 50000 AND 100000 THEN 'c. $50K-$100K'
      WHEN ${sum_salary_income_txn_0_365} > 100000 THEN 'd. $100K+'
    END ;;
  }

  dimension: sum_utilities_expense_txn {
    type: number
    sql: ${TABLE}."SUM_UTILITIES_EXPENSE_TXN" ;;
  }
  dimension: tot_bal_open_credit_union_trades {
    type: number
    sql: ${TABLE}."TOT_BAL_OPEN_CREDIT_UNION_TRADES" ;;
  }
  dimension: tot_bal_open_dep_store_trades {
    type: number
    sql: ${TABLE}."TOT_BAL_OPEN_DEP_STORE_TRADES" ;;
  }
  dimension: tot_bal_open_installment_trades {
    type: number
    sql: ${TABLE}."TOT_BAL_OPEN_INSTALLMENT_TRADES" ;;
  }
  dimension: tot_bal_open_retail_trades {
    type: number
    sql: ${TABLE}."TOT_BAL_OPEN_RETAIL_TRADES" ;;
  }
  dimension: tot_bal_revolving_trades {
    type: number
    sql: ${TABLE}."TOT_BAL_REVOLVING_TRADES" ;;
  }
  dimension: tot_high_credit_open_bankcard {
    type: number
    sql: ${TABLE}."TOT_HIGH_CREDIT_OPEN_BANKCARD" ;;
  }
  dimension: tot_high_credit_open_revolving {
    type: number
    sql: ${TABLE}."TOT_HIGH_CREDIT_OPEN_REVOLVING" ;;
  }
  dimension: tot_loan_amt_open_installment {
    type: number
    sql: ${TABLE}."TOT_LOAN_AMT_OPEN_INSTALLMENT" ;;
  }
  dimension: tot_past_due_bal {
    type: number
    sql: ${TABLE}."TOT_PAST_DUE_BAL" ;;
  }
  dimension: tot_past_due_bal_retail {
    type: number
    sql: ${TABLE}."TOT_PAST_DUE_BAL_RETAIL" ;;
  }
  dimension: tot_util_bankcard_trades {
    type: number
    sql: ${TABLE}."TOT_UTIL_BANKCARD_TRADES" ;;
  }
  dimension: total_balance {
    type: number
    sql: ${TABLE}."TOTAL_BALANCE" ;;
  }

  dimension: balance_bucket {
    type: string
    sql: CASE
      WHEN ${total_balance} < 0 THEN 'a. <$0'
      WHEN ${total_balance} = 0 THEN 'b. $0'
      WHEN ${total_balance} BETWEEN 0 AND 25 THEN 'c. $0.01-$25'
      WHEN ${total_balance} BETWEEN 25 AND 100 THEN 'd. $25-$100'
      WHEN ${total_balance} BETWEEN 100 AND 1000 THEN 'e. $100-$1000'
      WHEN ${total_balance} > 1000 THEN 'f. $1000+'
    END ;;
  }

  dimension: total_unpaid_collections_bal_12_m {
    type: number
    sql: ${TABLE}."TOTAL_UNPAID_COLLECTIONS_BAL_12M" ;;
  }
  dimension: total_unpaid_collections_bal_24_m {
    type: number
    sql: ${TABLE}."TOTAL_UNPAID_COLLECTIONS_BAL_24M" ;;
  }
  dimension: user_id {
    type: string
    primary_key: yes
    sql: ${TABLE}."USER_ID" ;;
  }
  measure: count {
    type: count
  }
}
