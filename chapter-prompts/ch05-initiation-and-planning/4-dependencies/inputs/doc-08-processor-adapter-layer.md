# Doc 8 — Processor Adapter Layer

**Team:** Payments Platform · **Author:** Oskar Lindgren · **Date:** December 2025 · **Status:** Draft

## 1. Summary

One adapter per processor behind a common interface, so that the platform's authorisation path
does not care which processor handles a card.

## 2. Adapters

| Adapter | Processor | Status |
|---------|-----------|--------|
| northwind-adapter | Northwind Payments | Live |
| veloxa-adapter | Veloxa | Planned |
| tessera-adapter | Tessera Pay | Planned |

## 3. Card tokens

Cards are stored as processor tokens. Northwind tokens are held in Northwind's vault. Veloxa and
Tessera tokens cannot be used with Northwind; they must be migrated processor-to-processor
before a merchant's cards work on Northwind.

## 4. Routing

The adapter layer routes each authorisation by the merchant's processor assignment, read from a
routing table the adapter layer owns. Reassigning a merchant is a table change.

## 5. Open questions

- Token migration format and timing for Veloxa.
- Whether the Tessera adapter is needed at all if Marketplace merchants migrate first.
