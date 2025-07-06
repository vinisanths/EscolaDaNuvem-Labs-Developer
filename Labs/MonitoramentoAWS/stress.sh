# This script installs the stress tool on an Amazon Linux 2 instance and runs a CPU stress test.
sudo yum update -y
# Install EPEL repository for additional packages
sudo amazon-linux-extras install epel -y
# Install stress tool
sudo yum install stress -y
# Run stress test for 10 minutes with 8 CPU workers
stress --cpu 8 --timeout 600