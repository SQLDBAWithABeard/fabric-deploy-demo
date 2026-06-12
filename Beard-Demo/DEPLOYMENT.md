# Deployment summary
> _fabricdeploy artifact v1.0.0 | tool 0.1.0 | generated 2026-06-11_

This document describes, in plain language, everything this deployment will
create. For the Well-Architected decisions behind each setting, see AUDIT.md.

**Built with:** Terraform

## Estate

- Organisation: Beard
- Region(s): uksouth
- WAF profile: guarded
- Monitoring: Log Analytics off

## Capacity "dev" — nonprod

development and test workloads; lowest-friction settings.

- Size (SKU): F8
- Region: uksouth
- Disaster recovery: no
- Surge protection: disabled
- Networking: public network access allowed

### Environment "dev" (workspace Beard-dev-dev)

- Access:
    - (no workspace roles assigned)
- OneLake security: off
- Items:
    - lakey-dev — lakehouse: stores raw and prepared data together
    - warey-dev — warehouse: a SQL database for structured, queryable data
    - notey-dev — notebook: code for transforming data
    - pipey-dev — pipeline: an automated sequence that moves or processes data

### Environment "test" (workspace Beard-dev-test)

- Access:
    - (no workspace roles assigned)
- OneLake security: off
- Items:
    - lakey-test — lakehouse: stores raw and prepared data together
    - warey-test — warehouse: a SQL database for structured, queryable data
    - notey-test — notebook: code for transforming data
    - pipey-test — pipeline: an automated sequence that moves or processes data

## Capacity "prod" — prod

production workloads; private and governed by default.

- Size (SKU): F8
- Region: uksouth
- Disaster recovery: no
- Surge protection: enabled (reject above 80%)
- Networking: private (no public network access); private endpoints

### Environment "prod" (workspace Beard-prod-prod)

- Access:
    - (no workspace roles assigned)
- OneLake security: off
- Items:
    - lakey — lakehouse: stores raw and prepared data together
    - warey — warehouse: a SQL database for structured, queryable data
    - notey — notebook: code for transforming data
    - pipey — pipeline: an automated sequence that moves or processes data
