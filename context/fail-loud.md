# Fail loud: error #6000 instead of stale data

## Out-of-sync DepthCaches return an explicit error, never silently stale data

**Status:** active, stable since early in the project's life
**Confirmed** (code path in `packages/ubdcc-dcn/ubdcc_dcn/RestEndpoints.py`; present since commit `938eed7`, Oct 2024 — i.e. from the LUCIT era already, not a recent addition)

When a `DepthCacheNode` catches UBLDC's `DepthCacheOutOfSync`, `get_asks`/`get_bids` return `error_id="#6000"` instead of the last-known (now potentially stale) order-book levels.

**Reason:** stated explicitly in the README (commit `8490df2`): *"The cluster either serves consistent data or fails loudly; it never silently accumulates stale levels."* This is the suite-wide fail-loud philosophy applied to the cluster's public API specifically — a caller getting `#6000` can decide to wait, retry, or reduce confidence, instead of unknowingly trading on an order book that looks fine but no longer reflects the exchange.

**Rejected alternative (implicit):** serving the last-known state while a resync is in progress, to avoid returning errors to callers. Rejected by the same reasoning as the rest of the suite's fail-loud convention — a plausible-looking but wrong order book is worse than a visible gap.
