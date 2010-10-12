#!/bin/bash
SRC_DIR=$1
if [ -n "$SRC_DIR" ]; then
	SRC_DIR=$PWD
fi
echo "ng-server started. Using $SRC_DIR as the src directory!"
echo "Additional classpath: " $CLASSPATH
java -classpath /opt/clojure/clojure/clojure.jar:/opt/clojure/clojure-contrib/clojure-contrib.jar:/opt/clojure/vimclojure/build/vimclojure.jar:$SRC_DIR:$CLASSPATH com.martiansoftware.nailgun.NGServer 127.0.0.1
