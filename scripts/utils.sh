# Copyright 2017 Carsten Klein
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


function err_missing_dependency() {
  echo "missing dependency: ${1}"
  exit 1
}


function resolve_commands() {
  for d in ${1}; do
    p=$(which ${d})
    test -z "${p}" && err_missing_dependency "command ${d} not on path, check you environment"
    v=$(echo ${d} | tr '-' '_' | tr '[a-z]' '[A-Z]')
    export ${v}=${p}
  done
}


function resolve_dpkg_packages() {
  for d in ${1}; do
    p=$(dpkg -l | grep "^ii" | grep ${d})
    test -z "${p}" && err_missing_dependency "package ${d} not installed, install it with [sudo] apt-get install ${d}"
  done
}


function resolve_gts_projects() {
  for d in ${1}; do
    test -d ../"${d}" || err_missing_dependency "gittish project ../${d} not found, clone it using git to ../${d} and run ../${d}/configure"
  done
}


function resolve_ext_commands() {
  for d in ${1}; do
    p=$(which ${d})
    test -z "${p}" && err_missing_dependency "missing ext command ${d}"
    v=$(echo $(basename "${d}") | tr '-' '_' | tr '[a-z]' '[A-Z]')
    export ${v}=${p}
  done
}


function build_externals() {
  for d in ${1}; do
    fun="build_ext_$(echo ${d} | tr '-' '_')"
    ( set | grep ${fun} >/dev/null 2>/dev/null ) || err_missing_dependency "missing function ${fun} required for building external dependency ${d}"
    ${fun}
  done
}

# vim: expandtab:ts=2:sw=2:
