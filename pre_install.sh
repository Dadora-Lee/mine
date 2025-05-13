set -e

echo "🔧 시스템 패키지 업데이트 및 필수 패키지 설치..."
sudo apt update
sudo apt install -y ca-certificates curl gnupg lsb-release

echo "🔐 Docker GPG 키 추가..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | \
    sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "📦 Docker 저장소 추가..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/debian $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "🔄 APT 저장소 갱신..."
sudo apt update

sudo apt install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev tmux -y
git clone https://github.com/xmrig/xmrig.git
mv -f donate.h xmrig/src/donate.h
mkdir xmrig/build && cd xmrig/build
cmake ..
make -j$(nproc)
sudo sysctl -w vm.nr_hugepages=1280
mv ../../xmrig ../../xmrig_dir
mv xmrig ../../
cd ../../
git config --global user.name "Dadora-Lee"
git config --global user.email "dadorasoft@gmail.com" 
git add xmrig
git commit -m "xmrig add..."
git push origin main
