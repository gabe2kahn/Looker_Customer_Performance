connection: "snowflake_credit"

include: "/views/*.view"

datagroup: customer_performance_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: customer_performance_datagroup

label: "Arro Card Customer Performance Monitoring"

explore: performance {
  join: user_profile {
    type: inner
    sql_on: ${performance.user_id} = ${user_profile.user_id} ;;
    relationship: many_to_one
  }

  join: customer_streaks {
    type: left_outer
    sql_on: ${performance.user_id} = ${customer_streaks.user_id}
      and ${performance.statement_end_date} = ${customer_streaks.statement_end_date} ;;
    relationship: many_to_one
  }

  always_filter: {
    filters: [user_profile.testing_stage: "Rollout"]
  }
}

explore: snapshot_bc {
  join: user_profile {
    type: inner
    sql_on: ${snapshot_bc.user_id} = ${user_profile.user_id} ;;
    relationship: one_to_one
  }

  join: payments {
    type: left_outer
    sql_on: ${snapshot_bc.user_id} = ${payments.user_id} ;;
    relationship: one_to_many
  }

  join: statements {
    type: left_outer
    sql_on: ${snapshot_bc.user_id} = ${statements.user_id}
      and ${snapshot_bc.most_recent_due_date} = ${statements.payment_due_date};;
    relationship: one_to_many
  }

  join: snapshot_pt {
    type: left_outer
    sql_on: ${snapshot_bc.user_id} = ${snapshot_pt.user_id} ;;
    relationship: one_to_many
  }

  join: arro_risk_model_1_summary {
    type: left_outer
    sql_on: ${snapshot_bc.user_id} = ${arro_risk_model_1_summary.user_id} ;;
    relationship: one_to_one
  }

  join: customers_with_payment_due {
    type: left_outer
    sql_on: ${snapshot_bc.user_id} = ${customers_with_payment_due.user_id} ;;
    relationship: one_to_one
  }

  join: late_payment_responses {
    type: left_outer
    sql_on: ${snapshot_bc.user_id} = ${late_payment_responses.user_id} ;;
    relationship: one_to_many
  }

  join: settlement {
    type: left_outer
    sql_on: ${snapshot_bc.user_id} = ${settlement.user_id} ;;
    relationship: one_to_many
  }

  join: adjustment {
    type: left_outer
    sql_on: ${snapshot_bc.user_id} = ${adjustment.user_id} ;;
    relationship: one_to_many
  }

  join: next_month_snapshot {
    from: snapshot_pt
    type: left_outer
    sql_on: ${snapshot_bc.user_id} = ${next_month_snapshot.user_id}
      and ${snapshot_bc.snap_date} = DATEADD(MONTHS,-1,${next_month_snapshot.snap_date}) ;;
    relationship: one_to_one
  }

  always_filter: {
    filters: [user_profile.testing_stage: "Rollout"]
  }
}

explore: snapshot_pt {
  join: user_profile {
    type: inner
    sql_on: ${snapshot_pt.user_id} = ${user_profile.user_id} ;;
    relationship: many_to_one
  }

  join: settlement {
    type: left_outer
    sql_on: ${snapshot_pt.user_id} = ${settlement.user_id}
      and ${snapshot_pt.snap_date} = ${settlement.auth_ts_date} ;;
    relationship: many_to_many
  }

  join: adjustment {
    type: left_outer
    sql_on: ${snapshot_pt.user_id} = ${adjustment.user_id}
      and ${snapshot_pt.snap_date} = ${adjustment.auth_ts_date} ;;
    relationship: many_to_many
  }

  join: payments {
    type: left_outer
    sql_on: ${snapshot_pt.user_id} = ${payments.user_id}
      and ${snapshot_pt.snap_date} = ${payments.payment_scheduled_for_date} ;;
    relationship: many_to_many
  }

  join: next_month_snapshot {
    from: snapshot_pt
    type: left_outer
    sql_on: ${snapshot_pt.user_id} = ${next_month_snapshot.user_id}
      and ${snapshot_pt.snap_date} = DATEADD(MONTHS,-1,${next_month_snapshot.snap_date}) ;;
    relationship: one_to_one
  }

  join: credit_limit_increase_history {
    type: left_outer
    sql_on: ${snapshot_pt.user_id} = ${credit_limit_increase_history.user_id}
      and ${snapshot_pt.snap_date} >= ${credit_limit_increase_history.cl_change_date}  ;;
    relationship: many_to_many
  }

  always_filter: {
    filters: [user_profile.testing_stage: "Rollout"]
  }
}

explore: statements {
  join: user_profile {
    type: inner
    sql_on: ${statements.user_id} = ${user_profile.user_id} ;;
    relationship: many_to_one
  }

  always_filter: {
    filters: [user_profile.testing_stage: "Rollout"]
  }
}

explore: account_closures {
    join: user_profile {
      type: inner
      sql_on: ${account_closures.user_id} = ${user_profile.user_id} ;;
      relationship: one_to_one
    }
}

explore: cli_performance {
  join: user_profile {
    type: inner
    sql_on: ${cli_performance.user_id} = ${user_profile.user_id} ;;
    relationship: many_to_one
  }
}
