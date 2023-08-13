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
    sql_on: ${snapshot_bc.user_id} = ${statements.user_id} ;;
    relationship: one_to_many
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
