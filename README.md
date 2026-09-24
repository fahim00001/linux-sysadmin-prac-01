# Linux Sysadmin Practical Lab

## Project Overview

This project is a practical Linux system administration assignment completed on an AWS EC2 Ubuntu server.

The main purpose of this project was to understand how a Linux administrator manages service accounts, storage, system performance, monitoring, automation, logging, and cleanup operations.

---

# Environment & Tools Used

| Tool          | Purpose                   |
| ------------- | ------------------------- |
| AWS EC2       | Linux server environment  |
| Ubuntu        | Operating system          |
| Bash Script   | Automation                |
| stress-ng     | System stress testing     |
| Prometheus    | Monitoring system         |
| Node Exporter | System metrics collection |
| Cron          | Task scheduling           |
| Logrotate     | Log management            |
| Git/GitHub    | Version control           |

---

# Implementation

## 1. Service Account Creation

### Purpose

Create a separate service user to simulate a production application environment.

### What I Did

- Created a dedicated service account:

```
bgdsvc_fahim001
```

- Configured permissions and ownership.
- Set up SSH access.

### Challenges

- Understanding Linux user management.
- Managing file permissions.

### Learning Outcome

Learned how Linux controls access using users, groups, and permissions.

---

## 2. Temporary Storage Setup (tmpfs)

### Purpose

Create memory-based temporary storage for application data.

### What I Did

- Created tmpfs storage:

```
/mnt/bgdsvc_fahim001_tmp
```

- Verified mounted storage.

### Challenges

- Understanding mount points.
- Difference between disk storage and memory storage.

### Learning Outcome

Learned Linux storage management concepts.

---

## 3. System Stress Testing

### Purpose

Test system behavior under different workloads.

### What I Did

Performed:

- CPU stress testing
- Memory stress testing
- Disk population testing
- Combined resource testing

Tool used:

```
stress-ng
```

### Challenges

- Understanding resource usage changes.
- Monitoring system performance during stress.

### Learning Outcome

Learned how administrators test server performance.

---

## 4. Monitoring Setup

### Purpose

Implement server monitoring and collect system metrics.

### What I Did

Installed and configured:

- Prometheus
- Node Exporter

Monitored:

- CPU usage
- Memory usage
- Disk usage
- System metrics

### Challenges

- Understanding Prometheus architecture.
- Connecting exporters with monitoring tools.

### Learning Outcome

Learned the basics of Linux monitoring systems.

---

## 5. Monitoring Automation

### Purpose

Automatically collect system information without manual commands.

### What I Did

Created monitoring script:

```
bgdsvc_fahim001_monitor.sh
```

The script collects:

- CPU information
- Memory usage
- Disk usage
- Process information

Logs are stored in:

```
/var/log/bgdsvc_fahim001/
```

### Challenges

- Writing Bash automation scripts.
- Formatting command output.

### Learning Outcome

Learned how administrators automate repetitive tasks.

---

## 6. Cron Automation

### Purpose

Schedule automatic execution of monitoring tasks.

### What I Did

Configured cron job:

```
*/5 * * * * /usr/local/bin/bgdsvc_fahim001_monitor.sh
```

### Challenges

- Understanding cron syntax.
- Verifying scheduled execution.

### Learning Outcome

Learned Linux task scheduling.

---

## 7. Log Rotation

### Purpose

Prevent log files from consuming unlimited storage.

### What I Did

Configured logrotate:

```
/etc/logrotate.d/bgdsvc_fahim001
```

Implemented:

- Daily rotation
- Log retention
- Compression

### Challenges

- Understanding log rotation rules.
- Testing configuration safely.

### Learning Outcome

Learned Linux log management practices.

---

## 8. Cleanup Automation

### Purpose

Create a safe process to remove all created resources.

### What I Did

Created:

```
04_cleanup.sh
```

The script removes:

- Processes
- Cron jobs
- Monitoring scripts
- Logs
- Temporary storage
- Service account

### Challenges

- Removing resources in the correct order.
- Avoiding accidental deletion.

### Learning Outcome

Learned how administrators safely clean environments.

---

# Challenges Faced During The Project

During this assignment, I faced several practical challenges:

- SSH key configuration problems while connecting to AWS EC2.
- GitHub SSH authentication setup.
- Linux permission and ownership issues.
- Understanding Prometheus and monitoring workflow.
- Debugging Bash scripts.
- Managing service accounts and cleanup processes.

---

# Final Learning Outcomes

Through this project, I gained practical experience in:

- Linux system administration
- AWS EC2 management
- Bash scripting
- User and permission management
- Storage management
- System monitoring
- Automation using Cron
- Log management
- Infrastructure cleanup

---

# Project Structure

```
linux-sysadmin-practical-lab

├── scripts
│   ├── 01_create_user.sh
│   ├── 02_setup_tmpfs.sh
│   ├── 03_stress_and_populate.sh
│   └── 04_cleanup.sh
│
└── README.md
```
