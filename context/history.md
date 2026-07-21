# History

## LUCIT-Systems-and-Development origin

**Status:** superseded — repo now lives under `oliver-zehentleitner`, MIT-licensed
**Confirmed** (commit `e5aecb1` "Remove LUCIT licensing and rebrand to MIT open source"; earliest commit `32bdf57` "INIT", 2024-09-04, already within the LUCIT era)

Same lineage as the rest of the suite — this module was not born newer/independent of the LUCIT history despite being one of the more recently active repos. Package directories were renamed `lucit-ubdcc-* → ubdcc-*` as part of the rebrand.

**Reason:** LUCIT is no longer part of how this project is licensed, distributed, or supported.

## OVH → ghcr.io registry migration

**Status:** superseded — migration complete
**Confirmed** (commits `0421504` "K8s YAMLs: migrate to ghcr.io with version tag instead of SHA digest", `587c750` "Helm: update image registry URLs from OVH to ghcr.io")

Docker images now live on `ghcr.io/oliver-zehentleitner/ubdcc-*`. `admin/k8s/*.yaml` and `dev/helm/ubdcc/` no longer reference the old OVH container registry or its SHA256 digests.

**Note found while writing this:** `TASKS.md` still had this listed as an open backlog item ("Update Helm chart and K8s YAMLs to ghcr.io") and `AGENTS.md` repeated the same stale claim — both predate the actual migration commits above. Fixed the `AGENTS.md` claim as part of this pass; the `TASKS.md` checkbox is left for Oliver to close since it's his backlog, not `context/`'s to groom.

## No conda-forge distribution — by design, not an oversight

**Status:** active
**Confirmed** (commit `ea5fd2c`: "UBDCC is intentionally not distributed via conda-forge (PyPI + ghcr.io Docker only). The badge pointed at a build_conda.yml workflow that doesn't exist and never will.")

Unlike its sibling suite modules, UBDCC has no conda-forge feedstock and never did — distribution is PyPI (wheels per sub-package) plus Docker images on `ghcr.io`.

**Reason:** stated directly in the commit removing a leftover Anaconda badge — this was a deliberate scope decision for this module, not a migration-in-progress or an oversight like the LUCIT-era conda cleanups in the rest of the suite.
