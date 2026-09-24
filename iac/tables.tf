resource "databricks_sql_table" "date_dim" {
  catalog_name = var.catalog_name
  schema_name  = var.schema_name
  name         = "date_dim"
  table_type   = "MANAGED"

  column { name = "d_date_sk";           type = "INT"     }
  column { name = "d_date_id";           type = "STRING"  }
  column { name = "d_date";              type = "DATE"    }
  column { name = "d_month_seq";         type = "INT"     }
  column { name = "d_week_seq";          type = "INT"     }
  column { name = "d_quarter_seq";       type = "INT"     }
  column { name = "d_year";              type = "INT"     }
  column { name = "d_dow";              type = "INT"     }
  column { name = "d_moy";              type = "INT"     }
  column { name = "d_dom";              type = "INT"     }
  column { name = "d_qoy";              type = "INT"     }
  column { name = "d_fy_year";          type = "INT"     }
  column { name = "d_fy_quarter_seq";   type = "INT"     }
  column { name = "d_fy_week_seq";      type = "INT"     }
  column { name = "d_day_name";         type = "STRING"  }
  column { name = "d_quarter_name";     type = "STRING"  }
  column { name = "d_holiday";          type = "STRING"  }
  column { name = "d_weekend";          type = "STRING"  }
  column { name = "d_following_holiday"; type = "STRING" }
  column { name = "d_first_dom";        type = "INT"     }
  column { name = "d_last_dom";         type = "INT"     }
  column { name = "d_same_day_ly";      type = "INT"     }
  column { name = "d_same_day_lq";      type = "INT"     }
  column { name = "d_current_day";      type = "STRING"  }
  column { name = "d_current_week";     type = "STRING"  }
  column { name = "d_current_month";    type = "STRING"  }
  column { name = "d_current_quarter";  type = "STRING"  }
  column { name = "d_current_year";     type = "STRING"  }
}

resource "databricks_sql_table" "store_sales" {
  catalog_name = var.catalog_name
  schema_name  = var.schema_name
  name         = "store_sales"
  table_type   = "MANAGED"

  column { name = "ss_sold_date_sk";       type = "INT"     }
  column { name = "ss_sold_time_sk";       type = "INT"     }
  column { name = "ss_item_sk";            type = "INT"     }
  column { name = "ss_customer_sk";        type = "INT"     }
  column { name = "ss_cdemo_sk";           type = "INT"     }
  column { name = "ss_hdemo_sk";           type = "INT"     }
  column { name = "ss_addr_sk";            type = "INT"     }
  column { name = "ss_store_sk";           type = "INT"     }
  column { name = "ss_promo_sk";           type = "INT"     }
  column { name = "ss_ticket_number";      type = "BIGINT"  }
  column { name = "ss_quantity";           type = "INT"     }
  column { name = "ss_wholesale_cost";     type = "DECIMAL(7,2)" }
  column { name = "ss_list_price";         type = "DECIMAL(7,2)" }
  column { name = "ss_sales_price";        type = "DECIMAL(7,2)" }
  column { name = "ss_ext_discount_amt";   type = "DECIMAL(7,2)" }
  column { name = "ss_ext_sales_price";    type = "DECIMAL(7,2)" }
  column { name = "ss_ext_wholesale_cost"; type = "DECIMAL(7,2)" }
  column { name = "ss_ext_list_price";     type = "DECIMAL(7,2)" }
  column { name = "ss_ext_tax";            type = "DECIMAL(7,2)" }
  column { name = "ss_coupon_amt";         type = "DECIMAL(7,2)" }
  column { name = "ss_net_paid";           type = "DECIMAL(7,2)" }
  column { name = "ss_net_paid_inc_tax";   type = "DECIMAL(7,2)" }
  column { name = "ss_net_profit";         type = "DECIMAL(7,2)" }
}

resource "databricks_sql_table" "catalog_sales" {
  catalog_name = var.catalog_name
  schema_name  = var.schema_name
  name         = "catalog_sales"
  table_type   = "MANAGED"

  column { name = "cs_sold_date_sk";           type = "INT"          }
  column { name = "cs_sold_time_sk";           type = "INT"          }
  column { name = "cs_ship_date_sk";           type = "INT"          }
  column { name = "cs_bill_customer_sk";       type = "INT"          }
  column { name = "cs_bill_cdemo_sk";          type = "INT"          }
  column { name = "cs_bill_hdemo_sk";          type = "INT"          }
  column { name = "cs_bill_addr_sk";           type = "INT"          }
  column { name = "cs_ship_customer_sk";       type = "INT"          }
  column { name = "cs_ship_cdemo_sk";          type = "INT"          }
  column { name = "cs_ship_hdemo_sk";          type = "INT"          }
  column { name = "cs_ship_addr_sk";           type = "INT"          }
  column { name = "cs_call_center_sk";         type = "INT"          }
  column { name = "cs_catalog_page_sk";        type = "INT"          }
  column { name = "cs_ship_mode_sk";           type = "INT"          }
  column { name = "cs_warehouse_sk";           type = "INT"          }
  column { name = "cs_item_sk";                type = "INT"          }
  column { name = "cs_promo_sk";               type = "INT"          }
  column { name = "cs_order_number";           type = "BIGINT"       }
  column { name = "cs_quantity";               type = "INT"          }
  column { name = "cs_wholesale_cost";         type = "DECIMAL(7,2)" }
  column { name = "cs_list_price";             type = "DECIMAL(7,2)" }
  column { name = "cs_sales_price";            type = "DECIMAL(7,2)" }
  column { name = "cs_ext_discount_amt";       type = "DECIMAL(7,2)" }
  column { name = "cs_ext_sales_price";        type = "DECIMAL(7,2)" }
  column { name = "cs_ext_wholesale_cost";     type = "DECIMAL(7,2)" }
  column { name = "cs_ext_list_price";         type = "DECIMAL(7,2)" }
  column { name = "cs_ext_tax";                type = "DECIMAL(7,2)" }
  column { name = "cs_coupon_amt";             type = "DECIMAL(7,2)" }
  column { name = "cs_ext_ship_cost";          type = "DECIMAL(7,2)" }
  column { name = "cs_net_paid";               type = "DECIMAL(7,2)" }
  column { name = "cs_net_paid_inc_tax";       type = "DECIMAL(7,2)" }
  column { name = "cs_net_paid_inc_ship";      type = "DECIMAL(7,2)" }
  column { name = "cs_net_paid_inc_ship_tax";  type = "DECIMAL(7,2)" }
  column { name = "cs_net_profit";             type = "DECIMAL(7,2)" }
}

resource "databricks_sql_table" "store" {
  catalog_name = var.catalog_name
  schema_name  = var.schema_name
  name         = "store"
  table_type   = "MANAGED"

  column { name = "s_store_sk";        type = "INT"          }
  column { name = "s_store_id";        type = "STRING"       }
  column { name = "s_rec_start_date";  type = "DATE"         }
  column { name = "s_rec_end_date";    type = "DATE"         }
  column { name = "s_closed_date_sk";  type = "INT"          }
  column { name = "s_store_name";      type = "STRING"       }
  column { name = "s_number_employees"; type = "INT"         }
  column { name = "s_floor_space";     type = "INT"          }
  column { name = "s_hours";           type = "STRING"       }
  column { name = "s_manager";         type = "STRING"       }
  column { name = "s_market_id";       type = "INT"          }
  column { name = "s_geography_class"; type = "STRING"       }
  column { name = "s_market_desc";     type = "STRING"       }
  column { name = "s_market_manager";  type = "STRING"       }
  column { name = "s_division_id";     type = "INT"          }
  column { name = "s_division_name";   type = "STRING"       }
  column { name = "s_company_id";      type = "INT"          }
  column { name = "s_company_name";    type = "STRING"       }
  column { name = "s_street_number";   type = "STRING"       }
  column { name = "s_street_name";     type = "STRING"       }
  column { name = "s_street_type";     type = "STRING"       }
  column { name = "s_suite_number";    type = "STRING"       }
  column { name = "s_city";            type = "STRING"       }
  column { name = "s_county";          type = "STRING"       }
  column { name = "s_state";           type = "STRING"       }
  column { name = "s_zip";             type = "STRING"       }
  column { name = "s_country";         type = "STRING"       }
  column { name = "s_gmt_offset";      type = "DECIMAL(5,2)" }
  column { name = "s_tax_precentage";  type = "DECIMAL(5,2)" }
}

resource "databricks_sql_table" "web_sales" {
  catalog_name = var.catalog_name
  schema_name  = var.schema_name
  name         = "web_sales"
  table_type   = "MANAGED"

  column { name = "ws_sold_date_sk";          type = "INT"          }
  column { name = "ws_sold_time_sk";          type = "INT"          }
  column { name = "ws_ship_date_sk";          type = "INT"          }
  column { name = "ws_item_sk";               type = "INT"          }
  column { name = "ws_bill_customer_sk";      type = "INT"          }
  column { name = "ws_bill_cdemo_sk";         type = "INT"          }
  column { name = "ws_bill_hdemo_sk";         type = "INT"          }
  column { name = "ws_bill_addr_sk";          type = "INT"          }
  column { name = "ws_ship_customer_sk";      type = "INT"          }
  column { name = "ws_ship_cdemo_sk";         type = "INT"          }
  column { name = "ws_ship_hdemo_sk";         type = "INT"          }
  column { name = "ws_ship_addr_sk";          type = "INT"          }
  column { name = "ws_web_page_sk";           type = "INT"          }
  column { name = "ws_web_site_sk";           type = "INT"          }
  column { name = "ws_ship_mode_sk";          type = "INT"          }
  column { name = "ws_warehouse_sk";          type = "INT"          }
  column { name = "ws_promo_sk";              type = "INT"          }
  column { name = "ws_order_number";          type = "BIGINT"       }
  column { name = "ws_quantity";              type = "INT"          }
  column { name = "ws_wholesale_cost";        type = "DECIMAL(7,2)" }
  column { name = "ws_list_price";            type = "DECIMAL(7,2)" }
  column { name = "ws_sales_price";           type = "DECIMAL(7,2)" }
  column { name = "ws_ext_discount_amt";      type = "DECIMAL(7,2)" }
  column { name = "ws_ext_sales_price";       type = "DECIMAL(7,2)" }
  column { name = "ws_ext_wholesale_cost";    type = "DECIMAL(7,2)" }
  column { name = "ws_ext_list_price";        type = "DECIMAL(7,2)" }
  column { name = "ws_ext_tax";               type = "DECIMAL(7,2)" }
  column { name = "ws_coupon_amt";            type = "DECIMAL(7,2)" }
  column { name = "ws_ext_ship_cost";         type = "DECIMAL(7,2)" }
  column { name = "ws_net_paid";              type = "DECIMAL(7,2)" }
  column { name = "ws_net_paid_inc_tax";      type = "DECIMAL(7,2)" }
  column { name = "ws_net_paid_inc_ship";     type = "DECIMAL(7,2)" }
  column { name = "ws_net_paid_inc_ship_tax"; type = "DECIMAL(7,2)" }
  column { name = "ws_net_profit";            type = "DECIMAL(7,2)" }
}

resource "databricks_sql_table" "item" {
  catalog_name = var.catalog_name
  schema_name  = var.schema_name
  name         = "item"
  table_type   = "MANAGED"

  column { name = "i_item_sk";       type = "INT"          }
  column { name = "i_item_id";       type = "STRING"       }
  column { name = "i_rec_start_date"; type = "DATE"        }
  column { name = "i_rec_end_date";  type = "DATE"         }
  column { name = "i_item_desc";     type = "STRING"       }
  column { name = "i_current_price"; type = "DECIMAL(7,2)" }
  column { name = "i_wholesale_cost"; type = "DECIMAL(7,2)" }
  column { name = "i_brand_id";      type = "INT"          }
  column { name = "i_brand";         type = "STRING"       }
  column { name = "i_class_id";      type = "INT"          }
  column { name = "i_class";         type = "STRING"       }
  column { name = "i_category_id";   type = "INT"          }
  column { name = "i_category";      type = "STRING"       }
  column { name = "i_manufact_id";   type = "INT"          }
  column { name = "i_manufact";      type = "STRING"       }
  column { name = "i_size";          type = "STRING"       }
  column { name = "i_formulation";   type = "STRING"       }
  column { name = "i_color";         type = "STRING"       }
  column { name = "i_units";         type = "STRING"       }
  column { name = "i_container";     type = "STRING"       }
  column { name = "i_manager_id";    type = "INT"          }
  column { name = "i_product_name";  type = "STRING"       }
}

resource "databricks_sql_table" "customer_address" {
  catalog_name = var.catalog_name
  schema_name  = var.schema_name
  name         = "customer_address"
  table_type   = "MANAGED"

  column { name = "ca_address_sk";    type = "INT"          }
  column { name = "ca_address_id";    type = "STRING"       }
  column { name = "ca_street_number"; type = "STRING"       }
  column { name = "ca_street_name";   type = "STRING"       }
  column { name = "ca_street_type";   type = "STRING"       }
  column { name = "ca_suite_number";  type = "STRING"       }
  column { name = "ca_city";          type = "STRING"       }
  column { name = "ca_county";        type = "STRING"       }
  column { name = "ca_state";         type = "STRING"       }
  column { name = "ca_zip";           type = "STRING"       }
  column { name = "ca_country";       type = "STRING"       }
  column { name = "ca_gmt_offset";    type = "DECIMAL(5,2)" }
  column { name = "ca_location_type"; type = "STRING"       }
}

resource "databricks_sql_table" "customer" {
  catalog_name = var.catalog_name
  schema_name  = var.schema_name
  name         = "customer"
  table_type   = "MANAGED"

  column { name = "c_customer_sk";          type = "INT"    }
  column { name = "c_customer_id";          type = "STRING" }
  column { name = "c_current_cdemo_sk";     type = "INT"    }
  column { name = "c_current_hdemo_sk";     type = "INT"    }
  column { name = "c_current_addr_sk";      type = "INT"    }
  column { name = "c_first_shipto_date_sk"; type = "INT"    }
  column { name = "c_first_sales_date_sk";  type = "INT"    }
  column { name = "c_salutation";           type = "STRING" }
  column { name = "c_first_name";           type = "STRING" }
  column { name = "c_last_name";            type = "STRING" }
  column { name = "c_preferred_cust_flag";  type = "STRING" }
  column { name = "c_birth_day";            type = "INT"    }
  column { name = "c_birth_month";          type = "INT"    }
  column { name = "c_birth_year";           type = "INT"    }
  column { name = "c_birth_country";        type = "STRING" }
  column { name = "c_login";               type = "STRING" }
  column { name = "c_email_address";        type = "STRING" }
  column { name = "c_last_review_date_sk";  type = "INT"    }
}
