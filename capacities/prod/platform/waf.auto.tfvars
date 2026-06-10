# fabricdeploy artifact v1.0.0 | tool 0.1.0 | generated 2026-06-10
# Resolved WAF values for capacity 'prod' (prod).
# These reflect the guardrails applied by the WAF resolver. See AUDIT.md.
# (Keep this variable list in sync with render/context.py:waf_tfvars_rows — the
#  verbose profile surfaces the same values, annotated.)
sku                 = "F8"
public_access       = false
private_endpoints   = true
managed_vnet        = false
ip_firewall         = false
outbound_protection = false

surge_protection_enabled           = true
surge_protection_reject_percentage = 80
