# 1. Add Google Coral APT repository key
curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg \
  | gpg --dearmor -o /usr/share/keyrings/coral-edgetpu-archive-keyring.gpg

# 2. Add the Coral APT repository
echo "deb [signed-by=/usr/share/keyrings/coral-edgetpu-archive-keyring.gpg] \
https://packages.cloud.google.com/apt coral-edgetpu-stable main" \
| tee /etc/apt/sources.list.d/coral-edgetpu.list

# 3. Update package list
apt update

# 4. Install the Edge TPU Runtime
apt install libedgetpu1-std