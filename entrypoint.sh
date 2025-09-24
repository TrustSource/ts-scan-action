#!/bin/bash

# Exit on any error
set -e

echo "🔍 Starting TrustSource TS-Scan Action"

echo "Project Name: $PROJECT_NAME"
echo "Working Directory: $(pwd)"

# Validate required inputs
if [ -z "$PROJECT_NAME" ]; then
    echo "❌ Error: project_name is required"
    exit 1
fi

if [ -z "$API_KEY" ]; then
    echo "❌ Error: api_key is required"
    exit 1
fi


echo "🚀 Running TrustSource scan..."

ts-scan scan -o /tmp/scan.json $(pwd) 


if [ -f "/tmp/scan.json" ]; then
    echo "Uploading scan results to TrustSource..."
    ts-scan upload --project-name "$PROJECT_NAME" --api-key "$API_KEY" /tmp/scan.json    
fi


echo "✅ TrustSource scan completed successfully!"