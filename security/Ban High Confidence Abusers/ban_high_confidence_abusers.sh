# Get the server's IP address
server_ip=$(hostname -I | awk '{print $1}')

# Get the IP address you're connecting from (assuming SSH)
ssh_client_ip=$(echo $SSH_CLIENT | awk '{print $1}')

# Extract IPs from /var/log/secure
secure_ips=$(grep -oP '([0-9]{1,3}\.){3}[0-9]{1,3}' /var/log/secure | sort -u)

# Remove the server and your IP from the list
secure_ips=$(echo "$secure_ips" | grep -v -e "$server_ip" -e "$ssh_client_ip")

# Extract banned IPs from firewall-cmd
banned_ips=$(firewall-cmd --list-rich-rules | grep -oP '([0-9]{1,3}\.){3}[0-9]{1,3}' | sort -u)

# Compare the lists to get IPs that are in /var/log/secure but not banned
ips_to_check=$(comm -23 <(echo "$secure_ips") <(echo "$banned_ips"))

# Check each IP with AbuseIPDB
for ip in $ips_to_check; do
    result=$(curl -G https://api.abuseipdb.com/api/v2/check \
        --data-urlencode "ipAddress=$ip" \
        -d maxAgeInDays=365 \
        -d verbose \
        -H "Key: {APIKEY}" \
        -H "Accept: application/json" 2>/dev/null)

    confidence_score=$(echo $result | jq '.data.abuseConfidenceScore')

    if (( $(echo "$confidence_score == 100" | bc -l) )); then
        echo "$ip - Banning due to confidence score of 100."
        firewall-cmd --permanent --add-rich-rule="rule family='ipv4' source address='$ip' drop"
    else
        echo "$ip [Checked - Confidence Score: $confidence_score]"
    fi
done

# If any IPs were banned, reload the firewall rules
firewall-cmd --reload
