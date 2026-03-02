# Enterprise Image Registry Management - Level 2

## Overview
This project implements a complete CI/CD pipeline for Docker image publishing with security enforcement.

---

## Features Implemented

### 1. Private Registry Setup
- Local Docker registry running on port 5000
- Images tagged and pushed to: localhost:5000/company/app:1.0

### 2. Semantic Versioning
Image tags used:
- 1.2.3
- 1.2
- 1
- latest

This allows controlled version management and rollback capability.

### 3. Security Scanning (Trivy)
- Integrated Trivy in GitHub Actions pipeline
- Pipeline fails if CRITICAL vulnerabilities are detected
- Vulnerabilities fixed by upgrading OS packages inside Dockerfile

Security Policy:
- exit-code: 1
- severity: CRITICAL
- ignore-unfixed: true

### 4. SBOM Generation
- Generated CycloneDX SBOM using Trivy
- File: sbom.json

### 5. CI/CD Pipeline
Workflow file location:
.github/workflows/ci-cd-pipeline.yml

Pipeline steps:
1. Build Docker image
2. Scan image using Trivy
3. Fail build on CRITICAL vulnerabilities

---

## Rollback Procedure

To rollback to previous version:

docker pull localhost:5000/company/app:1.2
docker run -p 5000:5000 localhost:5000/company/app:1.2

---

## Incident Response Plan

If image is compromised:
1. Stop affected containers
2. Identify vulnerable version
3. Fix vulnerability in Dockerfile
4. Rebuild and rescan
5. Redeploy updated image

---

## Conclusion

This project demonstrates enterprise-level container security enforcement using:
- Docker
- Private Registry
- Trivy Security Scanning
- GitHub Actions CI/CD
- Semantic Versioning

