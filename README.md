# Azure HD Insight Deployment using Terraform

This GitHub repository houses terraform scripts required to house Azure HDInsight on Azure cloud subscription along with DevOps integration using Jenkins.

The State capture for terraform is stored on a Blob storage in Azure Datalake storage conintainer to get updated everytime we update the infrastructure for redendency (infact geographical redeundency).

## Branching
Latest emhancements will be updated to Master branch for release.
1. `master` branch
    > 1. merge needs `Pull Request` review/approval.
    > 1. Once reviewed and merged with `develop`, raise `Pull Request` for `master` for enhancement to be made.

1. `develop` branch
    > 1. Create Enhancement wise branches out of it.
    > 1. Work enhancements wise contribution.
    > 1. Push latest code with `Pull Requests` and get reviewed.
    > 1. merge needs `Pull Requests` review/approval.