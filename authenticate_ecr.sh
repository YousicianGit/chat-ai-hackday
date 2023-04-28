#!/usr/bin/env bash
set -eu

# This script is used in Airflow bash_command to authenticate ECR for SysadminWorker machine

REGION=$(curl -m1 -s http://169.254.169.254/latest/meta-data/placement/availability-zone | sed 's/[a-z]$//')
if [[ -z "$REGION" ]]; then
    REGION='eu-west-1'
fi

aws ecr get-login-password --region "$REGION" | docker login --username AWS --password-stdin "https://781124778026.dkr.ecr.${REGION}.amazonaws.com"
