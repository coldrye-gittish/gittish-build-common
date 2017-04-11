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

GTS_BUILD_COMMON_SCRIPT=../gittish-build-common/scripts

cd $(dirname ${0})
ROOT_DIR=${PWD}
test -f ${GTS_BUILD_COMMON_SCRIPT}/utils.sh || err_missing_dependency "missing ${GTS_BUILD_COMMON_SCRIPT}/utils.sh"
. ${GTS_BUILD_COMMON_SCRIPT}/utils.sh

PROJECT=$(basename ${ROOT_DIR})

. ${ROOT_DIR}/CONFIGURATION || exit 1

# resolve and build
resolve_gts_projects "${GTS_DEPS}"
resolve_dpkg_packages "${DPKG_DEPS}"
resolve_commands "${CMD_DEPS}"
build_externals "${EXT_DEPS}"
resolve_ext_commands "${EXT_CMD_DEPS}"

# vim: expandtab:ts=2:sw=2:
