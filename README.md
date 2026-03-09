# Server Stats Script

A simple **Bash script to analyze Linux server performance statistics**.  
This script collects important system metrics such as CPU usage, memory usage, disk usage, and the top resource-consuming processes.

It can be executed on **any Linux server** and provides a quick overview of system health.

---

## Features

The script displays the following statistics:

- Total CPU usage
- Total memory usage (Free vs Used with percentage)
- Total disk usage (Free vs Used with percentage)
- Top 5 processes by CPU usage
- Top 5 processes by memory usage

### Additional Information (Stretch Goals)

The script also provides:

- Operating System version
- System uptime
- Load average
- Logged in users
- Recent failed login attempts

---

## Project Page URL

https://roadmap.sh/projects/server-stats

---

## Requirements

- Linux system (Ubuntu, CentOS, Amazon Linux, etc.)
- Bash shell
- Basic Linux utilities:
  - `top`
  - `ps`
  - `df`
  - `free`
  - `awk`
  - `grep`

These tools are pre-installed on most Linux systems.

---

## Installation

Clone the repository:

```bash
git clone https://github.com/your-username/server-stats.git
cd server-stats