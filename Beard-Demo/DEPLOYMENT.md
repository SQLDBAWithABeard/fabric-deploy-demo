# Deployment summary
> _fabricdeploy artifact v1.0.0 | tool 0.1.0 | generated 2026-06-12_

This document describes, in plain language, everything this deployment will
create. For the Well-Architected decisions behind each setting, see AUDIT.md.

**Built with:** Terraform

## Estate

- Organisation: Beard-Demo
- Region(s): uksouth
- WAF profile: guarded
- Monitoring: Log Analytics off

## Capacity "beard-cap-dev" — nonprod

development and test workloads; lowest-friction settings.

- Size (SKU): F8
- Region: uksouth
- Disaster recovery: no
- Surge protection: disabled
- Networking: public network access allowed

### Environment "dev" (workspace Beard-Demo-beard-cap-dev-dev)

- Access:
    - Admins: 11111-11111-11111-11111
    - Members: 11111-11111-11111-11111
    - Contributors: 11111-11111-11111-11111
    - Viewers: 11111-11111-11111-11111
- OneLake security: on (restricted)
- Items:
    - lakey — lakehouse: stores raw and prepared data together
    - warey — warehouse: a SQL database for structured, queryable data
    - notey — notebook: code for transforming data
    - pipey — pipeline: an automated sequence that moves or processes data

### Environment "test" (workspace Beard-Demo-beard-cap-dev-test)

- Access:
    - Admins: 11111-11111-11111-11111
    - Members: 11111-11111-11111-11111
    - Contributors: 11111-11111-11111-11111
    - Viewers: 11111-11111-11111-11111
- OneLake security: on (restricted)
- Items:
    - lakey — lakehouse: stores raw and prepared data together
    - warey — warehouse: a SQL database for structured, queryable data
    - notey — notebook: code for transforming data
    - pipey — pipeline: an automated sequence that moves or processes data

## Capacity "Beard-Prod" — prod

production workloads; private and governed by default.

- Size (SKU): F8
- Region: uksouth
- Disaster recovery: no
- Surge protection: enabled (reject above 75%)
- Networking: private (no public network access); private endpoints

### Environment "prod" (workspace Beard-Demo-Beard-Prod-prod)

- Access:
    - Admins: 11111-11111-11111-11111
    - Members: 11111-11111-11111-11111
    - Contributors: 11111-11111-11111-11111
    - Viewers: 11111-11111-11111-11111
- OneLake security: on (restricted)
- Items:
    - lakey — lakehouse: stores raw and prepared data together
    - warey — warehouse: a SQL database for structured, queryable data
    - notey — notebook: code for transforming data
    - pipey — pipeline: an automated sequence that moves or processes data
