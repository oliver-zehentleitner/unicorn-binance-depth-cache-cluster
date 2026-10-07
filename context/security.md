# Security of the cluster API

## The cluster API is unauthenticated and assumes private infrastructure

**Id:** bfadc31c-b5f3-4591-8805-8d62f446d8d0
**Type:** decision
**Type:** constraint
**Status:** active
**Evidence:** confirmed
**Source:** maintainer, 2026-10-07; README "Security caveats"
**Revisit when:** UBDCC gets a noticeably larger user base, or development of the cluster resumes

UBDCC's REST endpoints have no authentication and no transport
encryption. That includes the internal ones: `/ubdcc_mgmt_backup`
answers on every pod, the public restapi included, and returns the full
cluster DB with the Binance API secrets in cleartext; a `POST` to it
replaces the DB. `/ubdcc_assign_credentials` hands a full key pair to
whoever asks on the mgmt port. Public responses (`get_cluster_info`,
`get_credentials_list`) only show masked key previews.

**Reason:** the keys have to be distributed inside the cluster — every
DCN needs a full pair, and the DB is replicated to every pod so the
self-healing backup flow survives a mgmt restart. Exposing full
secrets on the internal paths is therefore partly inherent to the
design, not an oversight. The protection boundary is the network: the
documentation says throughout that a cluster belongs on private
infrastructure (firewall, private VPC), never reachable from the public
internet.

**Rejected alternative:** authentication and encryption on the
cluster's internal API. Not rejected on the merits but deferred: the
project currently has few users and is on hold, and that work only
pays off once more people run clusters — the README already says the
project is "building from the core outward".
