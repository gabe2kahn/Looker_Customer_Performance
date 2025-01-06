view: customer_offers_events {
  sql_table_name: "CUSTOMER"."CUSTOMER_OFFERS_EVENTS" ;;

  dimension: event_metadata {
    type: string
    sql: ${TABLE}."EVENT_METADATA" ;;
  }
  dimension: event_name {
    type: string
    sql: ${TABLE}."EVENT_NAME" ;;
  }
  dimension_group: event {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."EVENT_TS" AS TIMESTAMP_NTZ) ;;
  }
  dimension: hidden_reason {
    type: string
    sql: ${TABLE}."HIDDEN_REASON" ;;
  }

  dimension: offer_category {
    type: string
    sql: ${TABLE}."OFFER_CATEGORY" ;;
  }
  dimension: offer_description {
    type: string
    sql: ${TABLE}."OFFER_DESCRIPTION" ;;
  }
  dimension: offer_event_id {
    type: number
    primary_key: yes
    sql: ${TABLE}."OFFER_EVENT_ID" ;;
  }
  dimension: offer_id {
    type: number
    sql: ${TABLE}."OFFER_ID" ;;
  }
  dimension: offer_name {
    type: string
    sql: ${TABLE}."OFFER_NAME" ;;
  }
  dimension: payout {
    type: number
    sql: ${TABLE}."PAYOUT" ;;
  }
  dimension: user_id {
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: offers_revenue {
    type: sum
    sql: ${payout} ;;
    value_format_name: usd
  }
}
