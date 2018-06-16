#!/bin/bash
#===============================================================================
# Copyright 2014-2018 Intel Corporation
# All Rights Reserved.
#
# If this  software was obtained  under the  Intel Simplified  Software License,
# the following terms apply:
#
# The source code,  information  and material  ("Material") contained  herein is
# owned by Intel Corporation or its  suppliers or licensors,  and  title to such
# Material remains with Intel  Corporation or its  suppliers or  licensors.  The
# Material  contains  proprietary  information  of  Intel or  its suppliers  and
# licensors.  The Material is protected by  worldwide copyright  laws and treaty
# provisions.  No part  of  the  Material   may  be  used,  copied,  reproduced,
# modified, published,  uploaded, posted, transmitted,  distributed or disclosed
# in any way without Intel's prior express written permission.  No license under
# any patent,  copyright or other  intellectual property rights  in the Material
# is granted to  or  conferred  upon  you,  either   expressly,  by implication,
# inducement,  estoppel  or  otherwise.  Any  license   under such  intellectual
# property rights must be express and approved by Intel in writing.
#
# Unless otherwise agreed by Intel in writing,  you may not remove or alter this
# notice or  any  other  notice   embedded  in  Materials  by  Intel  or Intel's
# suppliers or licensors in any way.
#
#
# If this  software  was obtained  under the  Apache License,  Version  2.0 (the
# "License"), the following terms apply:
#
# You may  not use this  file except  in compliance  with  the License.  You may
# obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
#
#
# Unless  required  by   applicable  law  or  agreed  to  in  writing,  software
# distributed under the License  is distributed  on an  "AS IS"  BASIS,  WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#
# See the   License  for the   specific  language   governing   permissions  and
# limitations under the License.
#===============================================================================

daal_help() {
    echo "Syntax: source $__daal_tmp_script_name <arch>"
    echo "Where <arch> is one of:"
    echo "  ia32      - setup environment for IA-32 architecture"
    echo "  intel64   - setup environment for Intel(R) 64 architecture"
    echo ""
    echo "If the arguments to the sourced script are ignored (consult docs for"
    echo "your shell) the alternative way to specify target is environment"
    echo "variables COMPILERVARS_ARCHITECTURE or DAALVARS_ARCHITECTURE to pass"
    echo "<arch> to the script."
    echo ""
}

set_daal_env() {
    __daal_tmp_dir=${INSTALLDIR}
    __daal_tmp_dir=$__daal_tmp_dir/daal
    if [ ! -d $__daal_tmp_dir ]; then
        __daal_tmp_dir=$(command -p cd $(dirname -- "${BASH_SOURCE}")/..; pwd)
    fi

    __daal_tmp_script_name="daalvars.sh"
    __daal_tmp_target_arch=""

    if [ -z "$1" ] ; then
        if [ -n "$DAALVARS_ARCHITECTURE" ] ; then
            __daal_tmp_target_arch="$DAALVARS_ARCHITECTURE"
        elif [ -n "$COMPILERVARS_ARCHITECTURE" ] ; then
            __daal_tmp_target_arch="$COMPILERVARS_ARCHITECTURE"
        fi
    else
        __daal_tmp_target_arch=$1
    fi

    case $__daal_tmp_target_arch in
        ia32|intel64)
            export DAALROOT=$__daal_tmp_dir
            export CPATH=$__daal_tmp_dir/include${CPATH+:${CPATH}}
            if [ -z "$TBBROOT" ]; then
                export LIBRARY_PATH=$__daal_tmp_dir/lib/${__daal_tmp_target_arch}_fre:/usr/local/lib${LIBRARY_PATH+:${LIBRARY_PATH}}
                export LD_LIBRARY_PATH=$__daal_tmp_dir/lib/${__daal_tmp_target_arch}_fre:/usr/local/lib${LD_LIBRARY_PATH+:${LD_LIBRARY_PATH}}
            else
                export LIBRARY_PATH=$__daal_tmp_dir/lib/${__daal_tmp_target_arch}_fre${LIBRARY_PATH+:${LIBRARY_PATH}}
                export LD_LIBRARY_PATH=$__daal_tmp_dir/lib/${__daal_tmp_target_arch}_fre${LD_LIBRARY_PATH+:${LD_LIBRARY_PATH}}
            fi
            export CLASSPATH=$__daal_tmp_dir/lib/daal.jar${CLASSPATH+:${CLASSPATH}}
            ;;
        *) daal_help
            ;;
    esac
}

set_daal_env "$@"
