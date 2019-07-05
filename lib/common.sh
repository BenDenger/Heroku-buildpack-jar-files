#!/usr/bin/env bash

install_jdk() {
  local install_dir=${1:?}
  local cache_dir=${2:?}

  JVM_COMMON_BUILDPACK=${JVM_COMMON_BUILDPACK:-https://buildpack-registry.s3.amazonaws.com/buildpacks/heroku/jvm.tgz}
  mkdir -p /tmp/jvm-common
  curl --retry 3 --silent --location $JVM_COMMON_BUILDPACK | tar xzm -C /tmp/jvm-common --strip-components=1
  source /tmp/jvm-common/bin/util
  source /tmp/jvm-common/bin/java
  source /tmp/jvm-common/opt/jdbc.sh


  install_java_with_overlay "${install_dir}" "${cache_dir}"
}
