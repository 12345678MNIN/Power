#!/data/data/com.termux/files/usr/bin/bash

# Lmka Script - More powerful than Hydra
# Made for Termux

# Install figlet and display a banner
pkg install figlet -y > /dev/null 2>&1
clear
figlet "power Copyright"

echo "🔵 Lmka Script - Starting..."

# Check dependencies
echo "🔍 Checking dependencies..."
pkg update -y && pkg upgrade -y
pkg install git wget curl python -y

# Install Hydra if not already installed
if ! command -v hydra &> /dev/null; then
    echo "⚙️ Installing Hydra..."
    pkg install hydra -y
fi

# Function to run Hydra attack
hydra_attack() {
    read -p "🔹 Target IP or Host: " target
    read -p "🔹 Username: " user
    read -p "🔹 Wordlist path: " wordlist
    hydra -l $user -P $wordlist "$1://$target" -V
}

# Main Menu
while true; do
    clear
    figlet "Lmka Script"
    echo "🔵 MAIN MENU - Select an option:"
    echo "-------------------------------------"
    echo "💀 [01-10] Hydra Attacks"
    echo "🛠️ [11-20] Security Tools"
    echo "🕵️ [21-30] Scanners & Recon"
    echo "🔗 [31-40] Network Attacks"
    echo "🔍 [41-50] Vulnerability Testing"
    echo "🎭 [51-60] Anonymity & Proxy"
    echo "💾 [61-70] Data Management"
    echo "📡 [71-80] Wi-Fi Attacks"
    echo "🖥️ [81-90] Server Pentesting"
    echo "🚀 [91-100] Advanced Tools"
    echo "❌ [101] Exit"
    echo "-------------------------------------"
    
    read -p "👉 Choose: " option

    case $option in
        1) hydra_attack ssh ;;
        2) hydra_attack ftp ;;
        3) hydra_attack telnet ;;
        4) hydra_attack rdp ;;
        5) hydra_attack mysql ;;
        6) hydra_attack postgresql ;;
        7) hydra_attack http-form ;;
        8) hydra_attack smtp ;;
        9) hydra_attack pop3 ;;
        10) hydra_attack imap ;;
        
        11) echo "🔧 Installing Metasploit..."; pkg install metasploit -y ;;
        12) echo "🔧 Installing SQLmap..."; pkg install sqlmap -y ;;
        13) echo "🔧 Installing Nmap..."; pkg install nmap -y ;;
        14) echo "🔧 Installing Nikto..."; pkg install nikto -y ;;
        15) echo "🔧 Installing John The Ripper..."; pkg install john -y ;;
        16) echo "🔧 Installing Aircrack-ng..."; pkg install aircrack-ng -y ;;
        17) echo "🔧 Installing Wireshark..."; pkg install wireshark -y ;;
        18) echo "🔧 Installing Netcat..."; pkg install netcat -y ;;
        19) echo "🔧 Installing Reaver..."; pkg install reaver -y ;;
        20) echo "🔧 Installing Hashcat..."; pkg install hashcat -y ;;
        
        21) echo "🕵️ Scanning open ports..."; nmap -p- -T4 -A ;;
        22) echo "🕵️ Enumerating subdomains..."; amass enum -d ;;
        23) echo "🕵️ Gathering DNS info..."; dnsenum ;;
        24) echo "🕵️ Testing SQL Injection..."; sqlmap --dbs ;;
        25) echo "🕵️ Identifying web technologies..."; whatweb ;;
        26) echo "🕵️ Scanning for web vulnerabilities..."; nikto -h ;;
        27) echo "🕵️ Bruteforcing directories..."; dirb ;;
        28) echo "🕵️ Detecting CMS..."; wpscan ;;
        29) echo "🕵️ Capturing network packets..."; tcpdump ;;
        30) echo "🕵️ Checking HTTP headers..."; curl -I ;;

        31) echo "🔗 Running DoS attack..."; hping3 --flood ;;
        32) echo "🔗 Attempting ARP Spoofing..."; arpspoof ;;
        33) echo "🔗 Performing MITM Attack..."; ettercap -G ;;
        34) echo "🔗 Sniffing traffic..."; driftnet ;;
        35) echo "🔗 Cracking hashes..."; hashcat ;;
        36) echo "🔗 Fuzzing for vulnerabilities..."; wfuzz ;;
        37) echo "🔗 Phishing attack..."; setoolkit ;;
        38) echo "🔗 Creating payloads..."; msfvenom ;;
        39) echo "🔗 Testing SSH credentials..."; hydra -l root -P rockyou.txt ssh ;;
        40) echo "🔗 Cloning websites..."; httrack ;;

        41) echo "🔍 Exploiting known vulnerabilities..."; searchsploit ;;
        42) echo "🔍 Scanning Wi-Fi networks..."; airodump-ng ;;
        43) echo "🔍 Cracking Wi-Fi passwords..."; aircrack-ng ;;
        44) echo "🔍 Monitoring network traffic..."; wireshark ;;
        45) echo "🔍 Testing API security..."; postman ;;
        46) echo "🔍 Cracking ZIP passwords..."; fcrackzip ;;
        47) echo "🔍 Bruteforcing FTP login..."; medusa ;;
        48) echo "🔍 Detecting active hosts..."; nmap -sn ;;
        49) echo "🔍 Attempting remote exploits..."; metasploit ;;
        50) echo "🔍 Attacking routers..."; reaver ;;

        51) echo "🎭 Using VPN for anonymity..."; openvpn ;;
        52) echo "🎭 Changing IP with Tor..."; tor ;;
        53) echo "🎭 Creating a reverse proxy..."; ngrok ;;
        54) echo "🎭 Browsing anonymously..."; proxychains ;;
        55) echo "🎭 Changing Tor identity..."; service tor restart ;;
        56) echo "🎭 Testing socks proxies..."; tsocks ;;
        57) echo "🎭 Checking system logs..."; dmesg ;;
        58) echo "🎭 Monitoring processes..."; htop ;;
        59) echo "🎭 Detecting keyloggers..."; chkrootkit ;;
        60) echo "🎭 Hiding files..."; steghide ;;

        101) echo "❌ Exiting..."; exit ;;
        
        *)
            echo "❌ Invalid option!"
            ;;
    esac
    read -p "Press ENTER to return to menu..."
done
