# Ban High Confidence Abuser Script for Linux

This subfolder in the `security` directory is dedicated to a specific Bash script designed to enhance the security of Linux systems by identifying and banning IP addresses with high abuse confidence scores, as reported by AbuseIPDB.

## Disclaimer

THE SCRIPT AND DOCUMENTATION IN THIS FOLDER ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. USE THIS SCRIPT AT YOUR OWN RISK. IN NO EVENT SHALL WE BE LIABLE FOR ANY DAMAGES WHATSOEVER ARISING OUT OF THE USE OF OR INABILITY TO USE THIS SCRIPT.

## Table of Contents
- [About the Script](#about-the-script)
- [Features](#features)
- [Usage](#usage)
- [Contribution](#contribution)
- [License](#license)

## About the Script
File: `ban_high_confidence_abusers.sh`

This script targets IP addresses that have high abuse confidence scores from AbuseIPDB. It collects IP addresses from system logs, compares them to the already banned IPs in the firewall, and, if they're not already banned and have a confidence score of 100, they're banned automatically.

## Features
- Extraction of server and client IP addresses (assuming SSH).
- Filtering of IP addresses from `/var/log/secure`.
- Comparison of IP addresses with the list of previously banned IPs.
- Usage of the AbuseIPDB API to retrieve the abuse confidence score.
- Automatic addition of IPs with a score of 100 to the firewall rules.
- Firewall rules reload at the script's conclusion.

## Signing Up for an Account on AbuseIPDB 
 
AbuseIPDB is a platform that allows users to check and report abusive IP addresses. If you wish to create an account, follow these steps:

1. **Visit the Website**: Navigate to the [AbuseIPDB website](https://www.abuseipdb.com/).
2. **Signup Page**: Locate and click on the "Sign Up" or "Register" button or link on the homepage.
3. **Provide Your Details**:
    - **Username**: Choose a unique username for your account.
    - **Email Address**: Enter a valid email address.
    - **Password**: Choose a strong password.
4. **Verification**: Upon signing up, a verification email might be sent to your provided email address. Open the email and click on the verification link to activate your account.
5. **Terms of Service**: Ensure you read and understand the platform's terms of service or user agreement before accepting.
6. **Finalize Registration**: After completing the above steps, there should be a button to finalize your registration. Click on it.
7. **Additional Settings**: After registering, log in to your account. From there, you can set up any additional preferences or settings.
8. **API Key**: If you're looking to use the AbuseIPDB API for integrations, navigate to the relevant section of your account to generate or retrieve your API key.

## Usage

1. **Clone the Repository**:
    ```bash
    git clone Cybrient-Technologies/teamsecure
    ```

2. **Navigate to the Script's Folder**:
    ```bash
    cd Linux/security/Ban\ High\ Confidence\ Abuser
    ```

3. **Make the Script Executable**:
    ```bash
    chmod +x ban_high_confidence_abusers.sh
    ```

4. **Run the Script**:
    ```bash
    ./ban_high_confidence_abusers.sh
    ```

## Contribution
Contributions to this repository are welcome. If you have a script or an improvement to suggest, please create a pull request or open an issue for discussion.

## License
This repository is licensed under the MIT License.

## Thanks
Shout out to the following partners for their support.

[![TeamSecure](https://teamsecure.io/dist/img/logo.small.png?01)](https://teamsecure.io/)