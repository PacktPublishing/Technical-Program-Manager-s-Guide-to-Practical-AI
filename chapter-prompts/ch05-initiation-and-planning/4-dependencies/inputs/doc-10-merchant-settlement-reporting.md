# Doc 10 — Settlement Reporting for Merchants

**Team:** Merchant Experience · **Author:** Hana Sato · **Date:** October 2025 · **Status:** Live

## 1. Summary

Merchants download a daily settlement report from merchant-portal, showing what was paid out
and why amounts differ from gross sales.

## 2. Data

merchant-portal reads the daily settlement record per merchant from settlement-api (REST, v1)
and renders it as CSV and PDF. The report format is contractual for enterprise merchants and
cannot change without notice.

## 3. Failure handling

If settlement-api has not produced a record by 06:00 UTC, the portal shows the previous day and
a banner. Merchants have contacted support about this twice in 2025.

## 4. Platforms

The report works identically for all three platforms because settlement-api hides the platform
differences.
