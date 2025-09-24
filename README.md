# TrustSource TS-Scan Action

A GitHub Action that scans your repository for dependencies and security vulnerabilities using the TrustSource [ts-scan](https://github.com/TrustSource/ts-scan) tool.

## Features

- Scans multiple dependency management systems (NPM, Maven, Gradle,  Python, Nuget)
- Runs in a secure Docker container
- Easy integration with existing workflows

## Inputs

| Input | Description | Required |
|-------|-------------|----------|
| `api_key` | TrustSource API key for authentication | Yes |
| `project_name` | Name of the project to scan in TrustSource | Yes |


## Usage

### Basic Usage

```yaml
name: Dependency Scan
on:
  push:
    branches: [ main ]

  pull_request:
    branches: [ main ]

jobs:
  dependency-scan:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
        
      - name: Run TrustSource Scan
        uses: TrustSource/ts-scan-action@v1
        with:
          project_name: 'my-awesome-project'
          api_key: ${{ secrets.TRUSTSOURCE_API_KEY }}
```

## Setup

### 1. Get your TrustSource API Key

1. Log in to your [TrustSource account](https://app.trustsource.io/)
2. Navigate to your account settings (Administration/Scanners&API Keys)
3. Generate or copy your API key

### 2. Add API Key to GitHub Secrets

1. Go to your repository settings
2. Navigate to "Secrets and variables" → "Actions"
3. Click "New repository secret"
4. Name: `TRUSTSOURCE_API_KEY`
5. Value: Your TrustSource API key

### 3. Create Workflow File

Create `.github/workflows/security-scan.yml` in your repository with the usage example above.


## Repository Access

The action has full access to the repository content where it's executed, allowing it to:
- Read dependency files
- Analyze project structure
- Access source code for scanning

## License

This project is licensed under the terms specified in the LICENSE file.

## Support

For issues related to:
- **GitHub Action**: Create an issue in this repository
- **TrustSource Platform**: Contact TrustSource support
- **TS-Scan Tool**: Refer to [TrustSource documentation](https://trustsource.github.io/ts-scan/)