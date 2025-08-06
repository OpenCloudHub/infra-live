<a id="readme-top"></a>

<!-- PROJECT LOGO & TITLE -->

<div align="center">
  <a href="https://github.com/opencloudhub/infra-live">
    <img src="https://raw.githubusercontent.com/opencloudhub/.github/main/references/brand/assets/logos/primary-logo-light-background.svg" alt="OpenCloudHub Logo" width="100%" style="max-width:320px;" height="160">
  </a>

<h1 align="center">Infrastructure Live</h1>

<!-- SHORT DESCRIPTION -->

<p align="center">
    Live infrastructure configuration using Terragrunt for OpenCloudHub MLOps platform environments.<br />
    <a href="https://github.com/opencloudhub"><strong>Explore the organization »</strong></a>
  </p>

<!-- BADGES -->

<p align="center">
    <a href="https://github.com/opencloudhub/infra-live/graphs/contributors">
      <img src="https://img.shields.io/github/contributors/opencloudhub/infra-live.svg?style=for-the-badge" alt="Contributors">
    </a>
    <a href="https://github.com/opencloudhub/infra-live/stargazers">
      <img src="https://img.shields.io/github/stars/opencloudhub/infra-live.svg?style=for-the-badge" alt="Stars">
    </a>
    <a href="https://github.com/opencloudhub/infra-live/issues">
      <img src="https://img.shields.io/github/issues/opencloudhub/infra-live.svg?style=for-the-badge" alt="Issues">
    </a>
    <a href="https://github.com/opencloudhub/infra-live/blob/main/LICENSE">
      <img src="https://img.shields.io/github/license/opencloudhub/infra-live.svg?style=for-the-badge" alt="License">
    </a>
  </p>
</div>

<!-- TABLE OF CONTENTS -->

<details>
  <summary>📑 Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>
    <li><a href="#repository-structure">Repository Structure</a></li>
    <li><a href="#infrastructure-overview">Infrastructure Overview</a></li>
    <li><a href="#getting-started">Getting Started</a></li>
    <li><a href="#development-workflow">Development Workflow</a></li>
    <li><a href="#common-tasks">Common Tasks</a></li>
    <li><a href="#cicd-pipeline">CI/CD Pipeline</a></li>
    <li><a href="#troubleshooting">Troubleshooting</a></li>
    <li><a href="#contributing">Contributing</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->

<h2 id="about-the-project">🏗️ About The Project</h2>

This repository contains the **live infrastructure configurations** for the OpenCloudHub MLOps platform. It uses [Terragrunt](https://terragrunt.gruntwork.io/) to manage infrastructure as code across multiple cloud providers and environments, following DRY principles and best practices.

**Purpose:**
- **Environment Management**: Separate configurations for non-prod and production environments
- **Multi-Cloud Support**: Consistent patterns across AWS, DigitalOcean, and other providers
- **GitOps Workflow**: Infrastructure changes managed through pull requests and automated CI/CD
- **Modular Design**: References reusable modules from [`infra-modules`](https://github.com/opencloudhub/infra-modules)

**Key Features:**
- 🔄 **DRY Configuration**: Shared settings via `root.hcl` and `_ENVCOMMON`
- 🌐 **Multi-Cloud**: AWS, DigitalOcean, and local development support
- 🔒 **GitOps Security**: All changes tracked, reviewed, and automated
- 📊 **Environment Consistency**: Identical patterns across environments

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- REPOSITORY STRUCTURE -->

<h2 id="repository-structure">📁 Repository Structure</h2>

```
infra-live/
├── _ENVCOMMON/                    # Shared configurations across environments
├── root.hcl                       # Global Terragrunt configuration
├── non-prod/                      # Non-production environments
│   ├── github/                    # GitHub organization management
│   │   ├── *.json                 # Configuration files (teams, repos, etc.)
│   │   └── terragrunt.hcl         # Terragrunt configuration
│   ├── aws/                       # AWS infrastructure (coming soon)
│   └── digitalocean/              # DigitalOcean infrastructure (coming soon)
├── prod/                          # Production environments
│   ├── aws/                       # AWS production infrastructure
│   └── digitalocean/              # DigitalOcean production infrastructure
└── LICENSE
```

### Configuration Hierarchy

1. **`root.hcl`** - Global settings (remote state, provider versions)
2. **`_ENVCOMMON/`** - Shared environment configurations
3. **`{env}/{provider}/`** - Environment and provider-specific settings
4. **`terragrunt.hcl`** - Module-specific configuration

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- INFRASTRUCTURE OVERVIEW -->

<h2 id="infrastructure-overview">🏗️ Infrastructure Overview</h2>

### Current Infrastructure

#### GitHub Organization (`non-prod/github/`)
- **Organization Management**: Settings, security policies, member management
- **Team Structure**: Admin, Platform, AI, and App teams with role-based access
- **Repository Management**: Automated repository creation with security rulesets
- **Security Enforcement**: Branch protection, required reviews, signed commits
- **Project Management**: Standardized labels, milestones, and issue templates

#### Planned Infrastructure

**AWS (`non-prod/aws/`, `prod/aws/`)**
- EKS clusters for Kubernetes workloads
- S3 buckets for data storage and model artifacts
- RDS instances for application databases
- CloudWatch for monitoring and logging

**DigitalOcean (`non-prod/digitalocean/`, `prod/digitalocean/`)**
- Kubernetes clusters (DOKS)
- Spaces for object storage
- Databases for application data
- Monitoring and alerting

### Environment Strategy

- **Non-Prod**: Development, testing, and staging workloads ( can later create more)
- **Prod**: Production MLOps platform and applications
- **Local**: Kind clusters for development (managed separately)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

<h2 id="getting-started">🚀 Getting Started</h2>

### Prerequisites

- [Terragrunt](https://terragrunt.gruntwork.io/docs/getting-started/install/) >= 0.82.0
- [OpenTofu](https://opentofu.org/docs/intro/install/) >= 1.10.0 (or Terraform)
- [GitHub CLI](https://cli.github.com/) (recommended)
- Cloud provider CLI tools (AWS CLI, doctl, etc.)

### Required Environment Variables

```bash
# GitHub (required for github module)
export GITHUB_TOKEN="ghp_xxxxxxxxxxxx"
export GITHUB_OWNER="OpenCloudHub"

# AWS (when working with AWS infrastructure)
export AWS_ACCESS_KEY_ID="your-access-key"
export AWS_SECRET_ACCESS_KEY="your-secret-key"
export AWS_DEFAULT_REGION="us-east-1"

# DigitalOcean (when working with DO infrastructure)
export DIGITALOCEAN_TOKEN="dop_v1_xxxxxxxxxxxx"
```

### Initial Setup

1. **Clone the repository:**
```bash
git clone https://github.com/opencloudhub/infra-live.git
cd infra-live
```

2. **Set up environment variables:**
```bash
# Copy and customize environment template
cp .env.example .env
source .env
```

3. **Initialize a specific environment:**
```bash
cd non-prod/github
terragrunt init
terragrunt plan
```
If you feel very safe about your configuration, you could also run the whole infrastructure
in one go from the root using:
```bash
terragrunt run init --all --source-update
terragrunt run fmt --all
terragrunt run validate --all
terragrunt hcl format --check --all
terragrunt run plan --all

# Import Modules repo or existing infra
cd non-prod/github
terragrunt import 'github_repository.all["infra-modules"]' infra-modules

# Apply
cd /workspaces/infra-live
terragrunt run apply --all

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- DEVELOPMENT WORKFLOW -->

<h2 id="development-workflow">🔄 Development Workflow</h2>

### Making Infrastructure Changes

#### 1. Create Feature Branch
```bash
git checkout -b feature/add-new-repository
```

#### 2. Make Changes
Edit the relevant JSON configuration files:
```bash
# Example: Adding a new repository
vim non-prod/github/repositories.json
```

#### 3. Test Locally
```bash
cd non-prod/github
terragrunt plan
```

#### 4. Commit and Push
```bash
git add .
git commit -m "feat: add new repository for ML experiments"
git push origin feature/add-new-repository
```

#### 5. Create Pull Request
- GitHub Actions will automatically run CI (format, validate, plan)
- Request review from team members
- CI must pass before merging

#### 6. Merge to Main
- Once approved and CI passes, merge to main
- CD pipeline automatically applies changes to infrastructure

### Working with JSON Configurations

The GitHub module uses JSON files for easy configuration management:

```json
// repositories.json - Add new repositories
{
  "my-new-repo": {
    "description": "Description of the new repository",
    "visibility": "public",
    "topics": ["machine-learning", "python"],
    "team_permissions": {
      "admin": "admin",
      "ai": "push"
    }
  }
}
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- COMMON TASKS -->

<h2 id="common-tasks">⚙️ Common Tasks</h2>

### Importing Existing Infrastructure

If you have existing resources that weren't created by Terraform:

#### Import GitHub Resources
```bash
cd non-prod/github

# Import existing repository
terragrunt import 'github_repository.all["existing-repo"]' existing-repo

# Import existing team
terragrunt import 'github_team.all["existing-team"]' 12345

# Import organization membership
terragrunt import 'github_membership.all["username"]' username
```

#### Find Resource IDs
```bash
# Get team IDs
gh api orgs/opencloudhub/teams --jq '.[] | {name, id}'

# Get repository info
gh api repos/opencloudhub/repository-name

# Get user IDs
gh api users/username --jq '.id'
```

### Adding New Environments

1. **Create directory structure:**
```bash
mkdir -p staging/aws
mkdir -p staging/github
```

2. **Copy base configuration:**
```bash
cp non-prod/github/terragrunt.hcl staging/github/
# Edit as needed for staging-specific settings
```

3. **Update configurations:**
```bash
# Modify JSON files for staging-specific settings
vim staging/github/repositories.json
```

### Managing Secrets

**Environment Variables** (Recommended):
```bash
export GITHUB_TOKEN="your-token"
export AWS_ACCESS_KEY_ID="your-key"
```

**GitHub Actions Secrets**:
- `GH_TOKEN` - GitHub Personal Access Token
- `GITHUB_OWNER` - Organization name
- `AWS_ACCESS_KEY_ID` - AWS credentials
- `AWS_SECRET_ACCESS_KEY` - AWS credentials

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CI/CD PIPELINE -->

<h2 id="cicd-pipeline">🔄 CI/CD Pipeline</h2>

### Continuous Integration (PR Workflow)

**Trigger**: Pull requests to `main` branch

**Steps**:
1. **Format Check**: `terragrunt hcl format --check --all`
2. **Validation**: `terragrunt validate --all`  
3. **Planning**: `terragrunt plan --all` (shows proposed changes)
4. **Comment on PR**: Plan output posted as PR comment

### Continuous Deployment (Main Branch)

**Trigger**: Pushes to `main` branch

**Steps**:
1. **Plan**: Review changes before applying
2. **Apply**: `terragrunt apply --all --auto-approve`
3. **Notification**: Results posted to monitoring channels

### Manual Deployment

For sensitive changes or troubleshooting:

```bash
# Apply specific module
cd non-prod/github
terragrunt apply

# Apply with confirmation
terragrunt apply --auto-approve=false

# Destroy resources (careful!)
terragrunt destroy
```

### Environment Protection

Production environments use GitHub Environment protection:
- **Required Reviewers**: Manual approval before deployment
- **Wait Timers**: Configurable delays for staged deployments
- **Branch Restrictions**: Only deploy from protected branches

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- TROUBLESHOOTING -->

<h2 id="troubleshooting">🔧 Troubleshooting</h2>

### Common Issues

#### State Drift
**Problem**: Infrastructure differs from Terraform state
```bash
# Check for drift
terragrunt refresh
terragrunt plan

# Import missing resources
terragrunt import 'resource.name' resource-id
```

#### Provider Version Conflicts
**Problem**: Provider version mismatches
```bash
# Update provider versions
terragrunt init -upgrade

# Clear cache and reinitialize
rm -rf .terragrunt-cache
terragrunt init
```

#### GitHub API Rate Limits
**Problem**: Too many API calls
```bash
# Check rate limit status
gh api rate_limit

# Wait for reset or use different token
```

### Validation Commands

```bash
# Verify infrastructure matches expectations
gh api orgs/opencloudhub
gh api orgs/opencloudhub/teams
gh api repos/opencloudhub/repository-name

# Check Terragrunt configuration
terragrunt validate
terragrunt hcl format --check
```

### Getting Help

1. **Check logs**: GitHub Actions logs for CI/CD failures
2. **Validate locally**: Run `terragrunt plan` to see proposed changes
3. **Review documentation**: Module-specific docs in `infra-modules` repo
4. **GitHub Discussions**: Community support and questions

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

<h2 id="contributing">👥 Contributing</h2>

### Development Guidelines

1. **Follow naming conventions**: Use descriptive, consistent names
2. **Update documentation**: Keep README and comments current
3. **Test thoroughly**: Validate changes in non-prod first
4. **Use feature branches**: No direct commits to main
5. **Write clear commit messages**: Follow conventional commits

### Code Standards

**Terragrunt Configuration**:
```hcl
# Use consistent formatting
terragrunt hcl format

# Include descriptive comments
# This configures the GitHub organization settings
inputs = {
  organization_config = jsondecode(file("organization-config.json"))
}
```

**JSON Configuration**:
```json
{
  "repository-name": {
    "description": "Clear description of purpose",
    "topics": ["relevant", "tags"],
    "team_permissions": {
      "admin": "admin"
    }
  }
}
```

### Pull Request Process

1. **Create feature branch** with descriptive name
2. **Make changes** and test locally  
3. **Update documentation** as needed
4. **Submit PR** with clear description
5. **Address feedback** from reviewers
6. **Merge after approval** and CI success

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<div align="center">
  <h3>🌟 OpenCloudHub MLOps Platform</h3>
  <p><em>Building in public • Learning together • Sharing knowledge</em></p>

<div>
    <a href="https://opencloudhub.github.io/docs">
      <img src="https://img.shields.io/badge/Read%20the%20Docs-2596BE?style=for-the-badge&logo=read-the-docs&logoColor=white" alt="Documentation">
    </a>
    <a href="https://github.com/orgs/opencloudhub/discussions">
      <img src="https://img.shields.io/badge/Join%20Discussion-181717?style=for-the-badge&logo=github&logoColor=white" alt="Discussions">
    </a>
    <a href="https://github.com/orgs/opencloudhub/projects">
      <img src="https://img.shields.io/badge/View%20Roadmap-0052CC?style=for-the-badge&logo=jira&logoColor=white" alt="Roadmap">
    </a>
  </div>
</div>