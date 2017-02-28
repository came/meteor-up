#!/bin/bash
export LANG=en
export MOCHA_PARALLEL="${MOCHA_PARALLEL:-2}"
export PORT=3400

source ./tests/setup.sh

#running a single test
function run_test {
    echo $PORT
    export PORT=`expr $PORT + $PARALLEL_SEQ`
    echo $PORT
    DOCKER_ID=$( docker run -p 0.0.0.0:$PORT:22 -d --privileged=true -e ROOT_PASS="pass" mup-tests-server )
    sleep 5
    export PROD_SERVER_USER=root
    export PROD_SERVER="0.0.0.0"
    export PROD_SERVER_PORT=$PORT
    export PROD_SERVER_PASSWORD="pass"
    cd $MUP_DIR
    npm test -- -g $1
     docker rm -f $( docker stop $DOCKER_ID) > /dev/null
}
export -f run_test

parallel --progress -j $MOCHA_PARALLEL run_test ::: </tmp/tests/tests.list
