#' @include meta.R
#' @importFrom assertthat assert_that
NULL

ga_scopes <- c(
  default = "https://www.googleapis.com/auth/analytics",
  edit = "https://www.googleapis.com/auth/analytics.edit",
  read_only = "https://www.googleapis.com/auth/analytics.readonly",
  manage_users = "https://www.googleapis.com/auth/analytics.manage.users",
  read_only_users = "https://www.googleapis.com/auth/analytics.manage.users.readonly"
)

gtm_scopes <- c(
  read_only = "https://www.googleapis.com/auth/tagmanager.readonly",
  edit_containers = "https://www.googleapis.com/auth/tagmanager.edit.containers",
  delete_containers = "https://www.googleapis.com/auth/tagmanager.delete.containers",
  edit_container_versions = "https://www.googleapis.com/auth/tagmanager.edit.containerversions",
  publish = "https://www.googleapis.com/auth/tagmanager.publish",
  manage_users = "https://www.googleapis.com/auth/tagmanager.manage.users",
  manage_accounts = "https://www.googleapis.com/auth/tagmanager.manage.accounts"
)

kGaDayOfWeek <- c(
  "Sun",
  "Mon",
  "Tue",
  "Wed",
  "Thu",
  "Fri",
  "Sat"
)

# Google Analytics dimension types
kGaDimTypes <- list(
  dates = c(
    "dateOfSession",
    "ga:date",
    "ga:dateHour",
    "ga:socialActivityTimestamp"#,
    #"mcf:conversionDate"
  ),
  orderedIntFactors = c(
    "ga:year",
    "ga:isoYear",
    "ga:month",
    "ga:week",
    "ga:isoWeek",
    "ga:day",
    "ga:dayOfWeek",
    "ga:hour",
    "ga:minute",
    "ga:yearMonth",
    "ga:yearWeek",
    "ga:isoYearIsoWeek"
  ),
  orderedOtherFactors = c(
    "ga:screenColors",
    "ga:screenResolution",
    "ga:userAgeBracket",
    "ga:visitorAgeBracket",
    "ga:dayOfWeekName",
    "rt:goalId"
  ),
  versions = c(
    "ga:browserVersion",
    "ga:operatingSystemVersion",
    "ga:flashVersion",
    "ga:appVersion",
    "ga:dcmClickCreativeVersion",
    "ga:dcmLastEventCreativeVersion"
  ),
  nums = c(
    "ga:latitude",
    "ga:longitude",
    "ga:visitLength",
    "ga:pageDepth",
    "ga:screenDepth",
    "ga:sessionDurationBucket",
    "ga:daysSinceLastVisit",
    "ga:daysSinceLastSession",
    "ga:sessionsToTransaction",
    "ga:visitsToTransaction",
    "ga:daysToTransaction",
    "ga:internalPromotionPosition",
    "ga:productListPosition",
    "ga:visitCount",
    "ga:sessionCount",
    "ga:nthMinute",
    "ga:nthHour",
    "ga:nthDay",
    "ga:nthWeek",
    "ga:nthMonth",
    #"mcf:pathLengthInInteractionsHistogram",
    #"mcf:timeLagInDaysHistogram",
    #"mcf:nthDay",
    "rt:minutesAgo",
    "rt:latitude",
    "rt:longitude"
  ),
  bools = c(
    "ga:isMobile",
    "ga:isTablet",
    "ga:javaEnabled",
    "ga:searchUsed",
    "ga:isTrueViewVideoAd",
    "ga:hasSocialSourceReferral"
  ),
  cohort_dimensions = c(
    "ga:cohort",
    "ga:cohortNthDay",
    "ga:cohortNthMonth",
    "ga:cohortNthWeek",
    "ga:acquisitionTrafficChannel",
    "ga:acquisitionSource",
    "ga:acquisitionMedium",
    "ga:acquisitionSourceMedium",
    "ga:acquisitionCampaign"
  ),
  cohort_metrics = c(
    "ga:cohortActiveUsers",
    "ga:cohortTotalUsers",
    "ga:cohortAppviewsPerUser",
    "ga:cohortGoalCompletionsPerUser",
    "ga:cohortPageviewsPerUser",
    "ga:cohortRetentionRate",
    "ga:cohortRevenuePerUser",
    "ga:cohortVisitDurationPerUser",
    "ga:cohortSessionsPerUser"
  )
)

time_series_dimensions <- c(
  "dateOfSession",
  "ga:cohortNthDay",
  "ga:cohortNthMonth",
  "ga:cohortNthWeek",
  "ga:date",
  "ga:dateHour",
  "ga:year",
  "ga:isoYear",
  "ga:month",
  "ga:week",
  "ga:isoWeek",
  "ga:day",
  "ga:dayOfWeek",
  "ga:hour",
  "ga:minute",
  "ga:yearMonth",
  "ga:yearWeek",
  "ga:isoYearIsoWeek",
  "ga:dayOfWeekName",
  "ga:daysSinceLastVisit",
  "ga:daysSinceLastSession",
  "ga:daysToTransaction",
  "ga:nthMinute",
  "ga:nthHour",
  "ga:nthDay",
  "ga:nthWeek",
  "ga:nthMonth",
  "mcf:nthDay",
  "rt:minutesAgo"
)

# calculated_metrics_regex <- "^avg|^percent|Rate$|^CPC$|^CTR$|^CPM$|^RPC$|^ROI$|^ROAS$|Per"

samplingLevel_levels <- c(
  DEFAULT = "DEFAULT",
  SMALL = "FASTER",
  LARGE = "HIGHER_PRECISION"
)

# Constants
# ---------

# Google Analytics date formats
kGaDateInFormat <- "%Y-%m-%d"
kGaDateOutFormat <- "%Y%m%d"

# The earliest valid date is 20050101. There is no upper limit restriction for a start-date.
kGaDateOrigin <- as.Date("2005-01-01")

kGaSortTypes <- c("VALUE", "DELTA", "SMART", "HISTOGRAM_BUCKET", "DIMENSION_AS_INTEGER")

# Google Analytics expression comparators
kGa4Ops <- list(
  metric_operators = c(
    "EQUAL" = "==",
    "LESS_THAN" = "<",
    "GREATER_THAN" = ">",
    "BETWEEN" = "<>"
  ),
  dimension_operators = c(
    "BEGINS_WITH" = NA,
    "ENDS_WITH" = NA,
    "REGEXP" = "=~",
    "PARTIAL" = "=@",
    "EXACT" = "==",
    "IN_LIST" = "[]",
    "NUMERIC_LESS_THAN" = "<",
    "NUMERIC_GREATER_THAN" = ">",
    "NUMERIC_BETWEEN" = "<>"
  ),
  negated_operators = c(
    "==" = "!=", "=~" = "!~", "=@" = "!@", "<" = ">=", ">" = "<="
  )
)

kGaOps <- list(
  met = c("==", "!=", "<", ">", "<=", ">=", "<>"),
  dim = c("==", "!=", "=~", "!~", "=@", "!@", "<>", "[]", "<", ">", "<=", ">=")
)

kMcfOps <- list(
  met = c("==", "!=", "<", ">", "<=", ">="),
  dim = c("==", "!=", "=~", "!~", "=@", "!@")
)

kRtOps <- list(
  met = c("==", "!=", "<", ">", "<=", ">="),
  dim = c("==", "!=", "=~", "!~", "=@", "!@")
)

# ganalytics tolerated dimension and metric prefixes
kPrefixDelim <- paste0("[", paste0(c(
  ":", ";", "\\-", "\\.", "_"),
collapse = ""), "]")
kGaPrefix <- paste0("^ga", kPrefixDelim)
kMcfPrefix <- paste0("^mcf", kPrefixDelim)
kRtPrefix <- paste0("^rt", kPrefixDelim)
kAnyPrefix <- paste0("^(ga|mcf|rt)", kPrefixDelim)

# Maximum dimensions and metrics allowed by Google Analytics Core Reporting API
kGaMax <- list(
  dimensions = 7L,
  metrics = 10L
)

# Maximum results per page and maximum rows accessible in a query.
kGaMaxResults <- 10000L
kGaMaxRows <- 1000000L

# Maximum queries per batch
kGaMaxBatchQueries <- 4L

user_permission_levels <- c(
  "READ_AND_ANALYZE", "COLLABORATE", "EDIT", "MANAGE_USERS"
)

gtm_container_permission_levels <- c(
  "read", "edit", "delete", "publish"
)

view_type_levels <- c("WEB", "APP")

currency_levels <- c(
  "ARS", "AUD", "BGN", "BRL", "CAD", "CHF",
  "CNY", "CZK", "DKK", "EUR", "GBP", "HKD",
  "HUF", "IDR", "INR", "JPY", "KRW", "LTL",
  "MXN", "NOK", "NZD", "PHP", "PLN", "RUB",
  "SEK", "THB", "TRY", "TWD", "USD", "VND", "ZAR"
)

filter_type_levels <- c(
  "INCLUDE", "EXCLUDE",
  "LOWERCASE", "UPPERCASE",
  "SEARCH_AND_REPLACE", "ADVANCED"
)

filter_field_levels <- c(
  "UNUSED",
  "PAGE_REQUEST_URI", "PAGE_HOSTNAME", "PAGE_TITLE",
  "REFERRAL", "COST_DATA_URI", "HIT_TYPE",
  "INTERNAL_SEARCH_TERM", "INTERNAL_SEARCH_TYPE",
  "SOURCE_PROPERTY_TRACKING_ID",
  "CAMPAIGN_SOURCE", "CAMPAIGN_MEDIUM", "CAMPAIGN_NAME", "CAMPAIGN_AD_GROUP",
  "CAMPAIGN_TERM", "CAMPAIGN_CONTENT", "CAMPAIGN_CODE", "CAMPAIGN_REFERRAL_PATH",
  "TRANSACTION_COUNTRY", "TRANSACTION_REGION",
  "TRANSACTION_CITY", "TRANSACTION_AFFILIATION",
  "ITEM_NAME", "ITEM_CODE", "ITEM_VARIATION",
  "TRANSACTION_ID", "TRANSACTION_CURRENCY_CODE",
  "PRODUCT_ACTION_TYPE",
  "BROWSER", "BROWSER_VERSION", "BROWSER_SIZE", "PLATFORM",
  "PLATFORM_VERSION", "LANGUAGE", "SCREEN_RESOLUTION", "SCREEN_COLORS",
  "JAVA_ENABLED", "FLASH_VERSION", "GEO_SPEED", "VISITOR_TYPE",
  "GEO_ORGANIZATION", "GEO_DOMAIN", "GEO_IP_ADDRESS", "GEO_IP_VERSION",
  "GEO_COUNTRY", "GEO_REGION", "GEO_CITY",
  "EVENT_CATEGORY", "EVENT_ACTION", "EVENT_LABEL",
  "CUSTOM_FIELD_1", "CUSTOM_FIELD_2", "USER_DEFINED_VALUE",
  "CUSTOM_DIMENSIONS",
  "APP_ID", "APP_INSTALLER_ID", "APP_NAME", "APP_VERSION", "SCREEN",
  "IS_APP", "IS_FATAL_EXCEPTION", "EXCEPTION_DESCRIPTION",
  "DEVICE_CATEGORY",
  "MOBILE_HAS_QWERTY_KEYBOARD", "MOBILE_HAS_NFC_SUPPORT",
  "MOBILE_HAS_CELLULAR_RADIO", "MOBILE_HAS_WIFI_SUPPORT",
  "MOBILE_BRAND_NAME", "MOBILE_MODEL_NAME",
  "MOBILE_MARKETING_NAME", "MOBILE_POINTING_METHOD",
  "SOCIAL_NETWORK", "SOCIAL_ACTION", "SOCIAL_ACTION_TARGET"
)

include_exclude_filter_match_type_levels <- c(
  "BEGINS_WITH", "EQUAL", "ENDS_WITH", "CONTAINS", "MATCHES"
)

user_segment_type_levels <- c(
  "BUILT_IN", "CUSTOM"
)

metadata_path <- get_metadata_path()
# if (nchar(metadata_path) == 0L) {
#   if (interactive()) GaMetaUpdate()
#   metadata_path <- get_metadata_path()
# }
assertthat::assert_that(file.exists(metadata_path))
load(metadata_path)

metric_data_types <- c(
  "Integer",
  "Currency",
  "Time",
  "Float",
  "Percentage"
)
