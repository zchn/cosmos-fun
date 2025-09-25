# Terraform Variable Interpolation Bug Fix

## Problem Description
The `aws_iam_policy` resource was using incorrect Terraform variable interpolation syntax for `var.secret_policy_suffix`. This caused the literal string `{var.secret_policy_suffix}` to appear in the policy name and description, rather than interpolating the variable's actual value.

## Before (Incorrect Syntax)
```hcl
resource "aws_iam_policy" "secrets_policy" {
  name        = "eks-secrets-policy-{var.secret_policy_suffix}"
  description = "IAM policy for EKS secrets access with suffix {var.secret_policy_suffix}"
  
  # ... rest of the policy configuration
}
```

## After (Correct Syntax)
```hcl
resource "aws_iam_policy" "secrets_policy" {
  name        = "eks-secrets-policy-${var.secret_policy_suffix}"
  description = "IAM policy for EKS secrets access with suffix ${var.secret_policy_suffix}"
  
  # ... rest of the policy configuration
}
```

## Key Changes
1. **Changed `{var.secret_policy_suffix}` to `${var.secret_policy_suffix}`**
   - The correct Terraform interpolation syntax uses `${}` not just `{}`
   - This ensures the variable's actual value is interpolated into the string

2. **Applied the fix to both name and description fields**
   - Both fields were using the incorrect syntax
   - Now both will properly interpolate the variable value

## Impact
- **Before**: Policy name would be literally `eks-secrets-policy-{var.secret_policy_suffix}`
- **After**: Policy name will be `eks-secrets-policy-<actual-value>` where `<actual-value>` is the value of the `secret_policy_suffix` variable

## File Location
The fix has been applied to `/workspace/modules/aws/eks/main.tf` around lines 109-111 as specified in the bug report.