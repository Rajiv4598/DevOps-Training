# Week 3 – Linux Advanced: Processes & Package Management
*Generated: 2025-10-03 14:13:30*

This guide covers **processes**, **services**, and **installing software**. You'll use `ps`, `top`, and `kill`, then install **nginx**, manage it with `systemctl`, and verify it at `http://localhost`. Save your notes and screenshots under `week3_linux_processes/`.

> Commands are shown with `$`. Lines with `#` are comments. Examples are for **Debian/Ubuntu**; RHEL/Fedora notes are included where different.

---

## 0) Make the project folder
```bash
# Recommended structure (alongside your week2 work)
mkdir -p ~/projects/devops/week3/week3_linux_processes/screenshots
cd ~/projects/devops/week3/week3_linux_processes
pwd
```

---

## 1) Processes: `ps`, `top`, `kill`
```bash
# List *a lot* of processes (table format)
ps aux | head -20

# Filter for a name (example: nginx – will show nothing until installed)
ps aux | grep nginx | grep -v grep
```

### `top` (real‑time)
```bash
top
```
- Navigate with arrows / PgUp / PgDn.  
- Sort by **CPU** (press `P`) or **MEM** (press `M`).  
- **Quit** with `q`.

### Practice killing a safe test process
```bash
# Start a dummy background process
sleep 300 &
echo $!        # prints its PID – copy this number

# Verify it's running
ps -p <PID> -o pid,ppid,cmd

# Politely ask it to exit (SIGTERM)
kill <PID>

# If it won't die, force kill (SIGKILL)
kill -9 <PID>

# Confirm it’s gone (should show no results)
ps -p <PID> -o pid,ppid,cmd
```

**Signals**: `kill -15` (TERM, default) lets a process clean up; `kill -9` (KILL) is immediate and unsafe for data.

---

## 2) Install nginx (web server)
**Debian/Ubuntu:**
```bash
sudo apt update
sudo apt install -y nginx
```

**RHEL/Fedora (if applicable):**
```bash
sudo dnf install -y nginx     # or: sudo yum install -y nginx
```

---

## 3) Services with `systemctl`
```bash
# Check status
sudo systemctl status nginx

# Start & enable at boot
sudo systemctl start nginx
sudo systemctl enable nginx

# Common actions
sudo systemctl restart nginx
sudo systemctl reload nginx   # pick up config changes without dropping connections
sudo systemctl stop nginx
```

**Ports & logs**
```bash
# Is nginx listening on port 80?
sudo ss -tulpn | grep :80

# Recent logs
sudo journalctl -u nginx --since "15 min ago"
```

---

## 4) Verify in browser (or via curl)
Open your browser to: **http://localhost** — you should see the **nginx welcome page**.

If you're on a headless server/WSL, use:
```bash
curl -I http://localhost      # expect: HTTP/1.1 200 OK
curl http://localhost | head  # should contain the word "nginx"
# WSL tip (opens Windows browser):
wslview http://localhost
```

---

## 5) Save screenshots
Take screenshots and place them in `./screenshots/` with names like:
- `1_top.png` – while `top` is running
- `2_ps_grep_nginx.png` – after installing nginx
- `3_nginx_welcome.png` – browser or curl output

Reference them in your notes like:
```markdown
![top](screenshots/1_top.png)
![ps nginx](screenshots/2_ps_grep_nginx.png)
![nginx welcome](screenshots/3_nginx_welcome.png)
```

---

## 6) Optional cleanup
```bash
# Stop and disable
sudo systemctl stop nginx
sudo systemctl disable nginx

# Remove package (Ubuntu/Debian)
sudo apt remove -y nginx
sudo apt autoremove -y
```

---

## 7) Commit & push to GitHub
Assuming your repo is `~/projects/devops` and remote already points to GitHub:

```bash
cd ~/projects/devops
git add week3/week3_linux_processes
git commit -m "Week 3: processes, nginx install, and service mgmt"
git push
```

> First push from this machine? Use your **GitHub username** and a **Personal Access Token** (not your password). If the remote has commits you don’t have, do `git pull --rebase origin main` first, resolve any conflicts, then push.

---

## 8) Checklist
- [ ] Ran `ps`, `top`, `kill` (with a dummy `sleep` process)
- [ ] Installed nginx
- [ ] Managed service with `systemctl` (status/start/enable/restart/stop)
- [ ] Verified `http://localhost`
- [ ] Saved screenshots in `screenshots/`
- [ ] Committed and pushed to GitHub

Happy hacking!
