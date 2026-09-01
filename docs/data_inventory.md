# Data Inventory

## accounts.csv
- **Rows**: 30000
- **Columns**: 11
- **Duplicate Rows**: 0

| column             | dtype   |   null_count |   null_pct |   distinct_count | is_candidate_pk   | min_date            | max_date            | suspicious   |
|:-------------------|:--------|-------------:|-----------:|-----------------:|:------------------|:--------------------|:--------------------|:-------------|
| account_id         | object  |            0 |       0    |            30000 | True              |                     |                     |              |
| borrower_id        | object  |          455 |       1.52 |            10943 | False             |                     |                     |              |
| loan_type          | object  |            0 |       0    |                5 | False             |                     |                     |              |
| principal_amount   | float64 |            0 |       0    |            29996 | False             |                     |                     |              |
| outstanding_amount | float64 |            0 |       0    |            29994 | False             |                     |                     |              |
| dpd                | int64   |            0 |       0    |               11 | False             |                     |                     |              |
| risk_segment       | object  |            0 |       0    |                4 | False             |                     |                     |              |
| status             | object  |            0 |       0    |                4 | False             |                     |                     |              |
| opened_at          | object  |            0 |       0    |            29993 | False             | 2024-01-01 00:02:27 | 2025-11-30 23:52:36 |              |
| timezone           | object  |            0 |       0    |                3 | False             |                     |                     |              |
| schema_version     | object  |            0 |       0    |                3 | False             |                     |                     |              |

## account_status_history.csv
- **Rows**: 60000
- **Columns**: 8
- **Duplicate Rows**: 0

| column      | dtype   |   null_count |   null_pct |   distinct_count | is_candidate_pk   | min_date            | max_date            | suspicious   |
|:------------|:--------|-------------:|-----------:|-----------------:|:------------------|:--------------------|:--------------------|:-------------|
| history_id  | object  |            0 |          0 |            60000 | True              |                     |                     |              |
| account_id  | object  |            0 |          0 |            25999 | False             |                     |                     |              |
| borrower_id | object  |            0 |          0 |            11916 | False             |                     |                     |              |
| event_at    | object  |            0 |          0 |            59898 | False             | 2026-01-01 00:01:08 | 2026-08-08 23:50:45 |              |
| status      | object  |            0 |          0 |                7 | False             |                     |                     |              |
| changed_by  | object  |            0 |          0 |              101 | False             |                     |                     |              |
| source      | object  |            0 |          0 |                5 | False             |                     |                     |              |
| recorded_at | object  |            0 |          0 |            59906 | False             | 2025-12-31 01:26:29 | 2026-08-09 22:02:27 |              |

## agents.csv
- **Rows**: 30000
- **Columns**: 8
- **Duplicate Rows**: 0

| column        | dtype   |   null_count |   null_pct |   distinct_count | is_candidate_pk   | min_date            | max_date            | suspicious   |
|:--------------|:--------|-------------:|-----------:|-----------------:|:------------------|:--------------------|:--------------------|:-------------|
| agent_id      | object  |            0 |          0 |             1000 | False             |                     |                     |              |
| employee_code | object  |            0 |          0 |             1099 | False             |                     |                     |              |
| agent_name    | object  |            0 |          0 |               10 | False             |                     |                     |              |
| vendor_id     | object  |            0 |          0 |               15 | False             |                     |                     |              |
| team          | object  |            0 |          0 |                5 | False             |                     |                     |              |
| status        | object  |            0 |          0 |                3 | False             |                     |                     |              |
| joined_at     | object  |            0 |          0 |            29995 | False             | 2024-01-01 00:10:05 | 2025-11-30 23:23:30 |              |
| updated_at    | object  |            0 |          0 |            29987 | False             | 2025-01-01 00:57:32 | 2026-08-03 23:45:38 |              |

## agent_sessions.csv
- **Rows**: 15000
- **Columns**: 7
- **Duplicate Rows**: 0

| column     | dtype   |   null_count |   null_pct |   distinct_count | is_candidate_pk   | min_date            | max_date            | suspicious   |
|:-----------|:--------|-------------:|-----------:|-----------------:|:------------------|:--------------------|:--------------------|:-------------|
| session_id | object  |            0 |          0 |            15000 | True              |                     |                     |              |
| agent_id   | object  |            0 |          0 |             1000 | False             |                     |                     |              |
| login_at   | object  |            0 |          0 |            14996 | False             | 2026-01-01 00:01:57 | 2026-08-08 23:51:54 |              |
| channel    | object  |            0 |          0 |                4 | False             |                     |                     |              |
| device_id  | object  |            0 |          0 |             1500 | False             |                     |                     |              |
| timezone   | object  |            0 |          0 |                2 | False             |                     |                     |              |
| logout_at  | object  |            0 |          0 |            14996 | False             | 2026-01-01 04:48:48 | 2026-08-09 07:50:12 |              |

## borrowers.csv
- **Rows**: 30600
- **Columns**: 8
- **Duplicate Rows**: 600

| column      | dtype   |   null_count |   null_pct |   distinct_count | is_candidate_pk   | min_date            | max_date            | suspicious   |
|:------------|:--------|-------------:|-----------:|-----------------:|:------------------|:--------------------|:--------------------|:-------------|
| borrower_id | object  |            0 |       0    |            11015 | False             |                     |                     |              |
| name        | object  |            0 |       0    |               10 | False             |                     |                     |              |
| phone       | float64 |          614 |       2.01 |            29395 | False             |                     |                     |              |
| email       | object  |          895 |       2.92 |            15377 | False             |                     |                     |              |
| city        | object  |            0 |       0    |               10 | False             |                     |                     |              |
| created_at  | object  |            0 |       0    |            29997 | False             | 2025-01-01 00:14:38 | 2026-08-03 23:37:55 |              |
| updated_at  | object  |            0 |       0    |            29991 | False             | 2025-01-01 00:19:40 | 2026-08-03 23:48:36 |              |
| state       | object  |            0 |       0    |                9 | False             |                     |                     |              |

## calls.csv
- **Rows**: 91350
- **Columns**: 11
- **Duplicate Rows**: 1271

| column       | dtype   |   null_count |   null_pct |   distinct_count | is_candidate_pk   | min_date            | max_date            | suspicious   |
|:-------------|:--------|-------------:|-----------:|-----------------:|:------------------|:--------------------|:--------------------|:-------------|
| call_id      | object  |            0 |          0 |            90000 | False             |                     |                     |              |
| account_id   | object  |            0 |          0 |            28408 | False             |                     |                     |              |
| borrower_id  | object  |            0 |          0 |            11992 | False             |                     |                     |              |
| event_at     | object  |            0 |          0 |            89796 | False             | 2025-12-29 06:52:37 | 2026-08-12 15:43:05 |              |
| agent_id     | object  |         1827 |          2 |             1000 | False             |                     |                     |              |
| campaign_id  | object  |            0 |          0 |              120 | False             |                     |                     |              |
| direction    | object  |            0 |          0 |                2 | False             |                     |                     |              |
| vendor_id    | object  |            0 |          0 |               15 | False             |                     |                     |              |
| call_status  | object  |            0 |          0 |                5 | False             |                     |                     |              |
| duration_sec | int64   |            0 |          0 |              900 | False             |                     |                     |              |
| timezone     | object  |            0 |          0 |                3 | False             |                     |                     |              |

## call_attempts.csv
- **Rows**: 120000
- **Columns**: 9
- **Duplicate Rows**: 0

| column         | dtype   |   null_count |   null_pct |   distinct_count | is_candidate_pk   | min_date            | max_date            | suspicious   |
|:---------------|:--------|-------------:|-----------:|-----------------:|:------------------|:--------------------|:--------------------|:-------------|
| attempt_id     | object  |            0 |          0 |           120000 | True              |                     |                     |              |
| account_id     | object  |            0 |          0 |            29451 | False             |                     |                     |              |
| borrower_id    | object  |            0 |          0 |            12000 | False             |                     |                     |              |
| event_at       | object  |            0 |          0 |           119605 | False             | 2026-01-01 00:01:18 | 2026-08-08 23:58:40 |              |
| call_id        | object  |            0 |          0 |            66244 | False             |                     |                     |              |
| agent_id       | object  |            0 |          0 |             1000 | False             |                     |                     |              |
| attempt_no     | int64   |            0 |          0 |                7 | False             |                     |                     |              |
| vendor_id      | object  |         2400 |          2 |               15 | False             |                     |                     |              |
| attempt_status | object  |            0 |          0 |                5 | False             |                     |                     |              |

## call_dispositions.csv
- **Rows**: 35000
- **Columns**: 8
- **Duplicate Rows**: 0

| column              | dtype   |   null_count |   null_pct |   distinct_count | is_candidate_pk   | min_date            | max_date            | suspicious   |
|:--------------------|:--------|-------------:|-----------:|-----------------:|:------------------|:--------------------|:--------------------|:-------------|
| disposition_id      | object  |            0 |          0 |            35000 | True              |                     |                     |              |
| account_id          | object  |            0 |          0 |            20603 | False             |                     |                     |              |
| borrower_id         | object  |            0 |          0 |            11359 | False             |                     |                     |              |
| event_at            | object  |            0 |          0 |            34966 | False             | 2026-01-01 00:10:00 | 2026-08-08 23:50:50 |              |
| call_id             | object  |            0 |          0 |            28971 | False             |                     |                     |              |
| agent_id            | object  |            0 |          0 |             1000 | False             |                     |                     |              |
| disposition_code    | object  |            0 |          0 |                9 | False             |                     |                     |              |
| disposition_version | object  |            0 |          0 |                3 | False             |                     |                     |              |

## campaigns.csv
- **Rows**: 120
- **Columns**: 7
- **Duplicate Rows**: 0

| column            | dtype   |   null_count |   null_pct |   distinct_count | is_candidate_pk   | min_date            | max_date            | suspicious   |
|:------------------|:--------|-------------:|-----------:|-----------------:|:------------------|:--------------------|:--------------------|:-------------|
| campaign_id       | object  |            0 |          0 |              120 | True              |                     |                     |              |
| campaign_name     | object  |            0 |          0 |                5 | False             |                     |                     |              |
| channel           | object  |            0 |          0 |                5 | False             |                     |                     |              |
| strategy_version  | object  |            0 |          0 |                4 | False             |                     |                     |              |
| start_at          | object  |            0 |          0 |              120 | False             | 2026-01-01 09:34:51 | 2026-05-29 20:31:27 |              |
| target_definition | object  |            0 |          0 |                5 | False             |                     |                     |              |
| end_at            | object  |            0 |          0 |              120 | False             | 2026-01-16 12:12:50 | 2026-08-16 18:13:39 |              |

## complaints.csv
- **Rows**: 8000
- **Columns**: 9
- **Duplicate Rows**: 0

| column         | dtype   |   null_count |   null_pct |   distinct_count | is_candidate_pk   | min_date            | max_date            | suspicious   |
|:---------------|:--------|-------------:|-----------:|-----------------:|:------------------|:--------------------|:--------------------|:-------------|
| complaint_id   | object  |            0 |          0 |             8000 | True              |                     |                     |              |
| account_id     | object  |            0 |          0 |             7034 | False             |                     |                     |              |
| borrower_id    | object  |            0 |          0 |             5839 | False             |                     |                     |              |
| event_at       | object  |            0 |          0 |             7997 | False             | 2026-01-01 00:38:02 | 2026-08-08 23:35:33 |              |
| complaint_type | object  |            0 |          0 |                7 | False             |                     |                     |              |
| severity       | object  |            0 |          0 |                4 | False             |                     |                     |              |
| status         | object  |            0 |          0 |                4 | False             |                     |                     |              |
| source         | object  |            0 |          0 |                5 | False             |                     |                     |              |
| resolution_at  | object  |            0 |          0 |             7998 | False             | 2026-01-02 07:36:01 | 2026-08-26 13:22:27 |              |

## daily_targeting.csv
- **Rows**: 45000
- **Columns**: 7
- **Duplicate Rows**: 0

| column              | dtype   |   null_count |   null_pct |   distinct_count | is_candidate_pk   | min_date            | max_date            | suspicious   |
|:--------------------|:--------|-------------:|-----------:|-----------------:|:------------------|:--------------------|:--------------------|:-------------|
| target_id           | object  |            0 |          0 |            45000 | True              |                     |                     |              |
| account_id          | object  |            0 |          0 |            23344 | False             |                     |                     |              |
| campaign_id         | object  |            0 |          0 |              120 | False             |                     |                     |              |
| target_date         | object  |            0 |          0 |              220 | False             | 2026-01-01 00:00:00 | 2026-08-08 00:00:00 |              |
| priority            | int64   |            0 |          0 |               10 | False             |                     |                     |              |
| recommended_channel | object  |            0 |          0 |                4 | False             |                     |                     |              |
| status              | object  |            0 |          0 |                4 | False             |                     |                     |              |

## data_dictionary.csv
- **Rows**: 143
- **Columns**: 3
- **Duplicate Rows**: 0

| column   | dtype   |   null_count |   null_pct |   distinct_count | is_candidate_pk   | min_date   | max_date   | suspicious   |
|:---------|:--------|-------------:|-----------:|-----------------:|:------------------|:-----------|:-----------|:-------------|
| dataset  | object  |            0 |          0 |               17 | False             |            |            |              |
| column   | object  |            0 |          0 |               80 | False             |            |            |              |
| dtype    | object  |            0 |          0 |                4 | False             |            |            |              |

## field_visits.csv
- **Rows**: 25000
- **Columns**: 10
- **Duplicate Rows**: 0

| column       | dtype   |   null_count |   null_pct |   distinct_count | is_candidate_pk   | min_date            | max_date            | suspicious   |
|:-------------|:--------|-------------:|-----------:|-----------------:|:------------------|:--------------------|:--------------------|:-------------|
| visit_id     | object  |            0 |          0 |            25000 | True              |                     |                     |              |
| account_id   | object  |            0 |          0 |            16908 | False             |                     |                     |              |
| borrower_id  | object  |            0 |          0 |            10537 | False             |                     |                     |              |
| event_at     | object  |            0 |          0 |            24973 | False             | 2026-01-01 00:07:53 | 2026-08-08 23:50:03 |              |
| agent_id     | object  |            0 |          0 |             1000 | False             |                     |                     |              |
| visit_type   | object  |            0 |          0 |                4 | False             |                     |                     |              |
| outcome      | object  |            0 |          0 |                6 | False             |                     |                     |              |
| latitude     | float64 |            0 |          0 |            25000 | False             |                     |                     |              |
| longitude    | float64 |            0 |          0 |            25000 | False             |                     |                     |              |
| scheduled_at | object  |          250 |          1 |            24730 | False             | 2025-12-31 05:21:55 | 2026-08-08 21:50:07 |              |

## payments.csv
- **Rows**: 25500
- **Columns**: 9
- **Duplicate Rows**: 486

| column            | dtype   |   null_count |   null_pct |   distinct_count | is_candidate_pk   | min_date            | max_date            | suspicious   |
|:------------------|:--------|-------------:|-----------:|-----------------:|:------------------|:--------------------|:--------------------|:-------------|
| payment_id        | object  |            0 |        0   |            25000 | False             |                     |                     |              |
| account_id        | object  |            0 |        0   |            16934 | False             |                     |                     |              |
| borrower_id       | object  |            0 |        0   |            10474 | False             |                     |                     |              |
| event_at          | object  |            0 |        0   |            24984 | False             | 2026-01-01 00:14:40 | 2026-08-08 23:50:23 |              |
| payment_reference | object  |          382 |        1.5 |            20821 | False             |                     |                     |              |
| amount            | float64 |            0 |        0   |            24979 | False             |                     |                     |              |
| payment_status    | object  |            0 |        0   |                4 | False             |                     |                     |              |
| payment_method    | object  |            0 |        0   |                5 | False             |                     |                     |              |
| provider_id       | object  |            0 |        0   |               15 | False             |                     |                     |              |

## promises_to_pay.csv
- **Rows**: 18000
- **Columns**: 9
- **Duplicate Rows**: 0

| column          | dtype   |   null_count |   null_pct |   distinct_count | is_candidate_pk   | min_date            | max_date            | suspicious   |
|:----------------|:--------|-------------:|-----------:|-----------------:|:------------------|:--------------------|:--------------------|:-------------|
| ptp_id          | object  |            0 |          0 |            18000 | True              |                     |                     |              |
| account_id      | object  |            0 |          0 |            13532 | False             |                     |                     |              |
| borrower_id     | object  |            0 |          0 |             9299 | False             |                     |                     |              |
| event_at        | object  |            0 |          0 |            17990 | False             | 2026-01-01 00:24:14 | 2026-08-08 23:59:33 |              |
| agent_id        | object  |            0 |          0 |             1000 | False             |                     |                     |              |
| promised_amount | float64 |            0 |          0 |            17983 | False             |                     |                     |              |
| promised_date   | object  |            0 |          0 |            17992 | False             | 2026-01-02 04:36:18 | 2026-09-06 21:23:52 |              |
| status          | object  |            0 |          0 |                4 | False             |                     |                     |              |
| source          | object  |            0 |          0 |                4 | False             |                     |                     |              |

## sms_events.csv
- **Rows**: 45000
- **Columns**: 8
- **Duplicate Rows**: 0

| column        | dtype   |   null_count |   null_pct |   distinct_count | is_candidate_pk   | min_date            | max_date            | suspicious   |
|:--------------|:--------|-------------:|-----------:|-----------------:|:------------------|:--------------------|:--------------------|:-------------|
| sms_event_id  | object  |            0 |          0 |            45000 | True              |                     |                     |              |
| account_id    | object  |            0 |          0 |            23207 | False             |                     |                     |              |
| borrower_id   | object  |            0 |          0 |            11728 | False             |                     |                     |              |
| event_at      | object  |            0 |          0 |            44949 | False             | 2026-01-01 00:04:16 | 2026-08-08 23:46:06 |              |
| message_id    | object  |            0 |          0 |            27001 | False             |                     |                     |              |
| event_type    | object  |            0 |          0 |                4 | False             |                     |                     |              |
| template_code | object  |            0 |          0 |                4 | False             |                     |                     |              |
| provider_id   | object  |            0 |          0 |               15 | False             |                     |                     |              |

## vendor_telephony.csv
- **Rows**: 15
- **Columns**: 6
- **Duplicate Rows**: 0

| column            | dtype   |   null_count |   null_pct |   distinct_count | is_candidate_pk   | min_date   | max_date   | suspicious   |
|:------------------|:--------|-------------:|-----------:|-----------------:|:------------------|:-----------|:-----------|:-------------|
| vendor_id         | object  |            0 |          0 |               15 | True              |            |            |              |
| vendor_name       | object  |            0 |          0 |                5 | False             |            |            |              |
| vendor_account_id | object  |            0 |          0 |               15 | True              |            |            |              |
| timezone          | object  |            0 |          0 |                2 | False             |            |            |              |
| status            | object  |            0 |          0 |                2 | False             |            |            |              |
| schema_version    | object  |            0 |          0 |                3 | False             |            |            |              |

## whatsapp_events.csv
- **Rows**: 60600
- **Columns**: 8
- **Duplicate Rows**: 600

| column            | dtype   |   null_count |   null_pct |   distinct_count | is_candidate_pk   | min_date            | max_date            | suspicious   |
|:------------------|:--------|-------------:|-----------:|-----------------:|:------------------|:--------------------|:--------------------|:-------------|
| whatsapp_event_id | object  |            0 |          0 |            60000 | False             |                     |                     |              |
| account_id        | object  |            0 |          0 |            25924 | False             |                     |                     |              |
| borrower_id       | object  |            0 |          0 |            11917 | False             |                     |                     |              |
| event_at          | object  |            0 |          0 |            59892 | False             | 2026-01-01 00:01:49 | 2026-08-08 23:56:16 |              |
| message_id        | object  |            0 |          0 |            34831 | False             |                     |                     |              |
| event_type        | object  |            0 |          0 |                6 | False             |                     |                     |              |
| template_code     | object  |            0 |          0 |                5 | False             |                     |                     |              |
| provider_id       | object  |            0 |          0 |               15 | False             |                     |                     |              |

