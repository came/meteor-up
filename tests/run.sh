source ./tests/setup.sh

docker rm -f mup-test-server
docker run -v /var/run/docker.sock:/var/run/docker.sock --name mup-test-server -p 0.0.0.0:3500:22 -v $MUP_DIR:/root/meteor-up -d -e ROOT_PASS="pass" mup-tests-server

export PROD_SERVER_USER="root"
export PROD_SERVER="0.0.0.0"
export PROD_SERVER_PORT=3500
export PROD_SERVER_PASSWORD="pass"

npm run test:custom-server
