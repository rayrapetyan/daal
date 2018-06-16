#!/bin/tcsh
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

set __daal_tmp_cpro_path=${INSTALLDIR}
setenv DAALROOT ${__daal_tmp_cpro_path}/daal

set __daal_tmp_script_name="daalvars.csh"
set __daal_tmp_target_arch=""

if ( $#argv == 0 ) then
    if ( $?COMPILERVARS_ARCHITECTURE ) then
        set __daal_tmp_target_arch="$COMPILERVARS_ARCHITECTURE"
    endif
    if ( $?DAALVARS_ARCHITECTURE ) then
        set __daal_tmp_target_arch="$DAALVARS_ARCHITECTURE"
    endif
else
    while ( "$1" != "" )
        if      ( "$1" == "ia32"      ) then
            set __daal_tmp_target_arch="ia32"
        else if ( "$1" == "intel64"   ) then
            set __daal_tmp_target_arch="intel64"
        else
            echo ""
            echo "ERROR: Unknown option '$1'"
            goto Help
        endif
        shift
    end
endif

if ( "${__daal_tmp_target_arch}" != "intel64" ) then
    if ( "${__daal_tmp_target_arch}" != "ia32" ) then
        echo "ERROR: architecture is not defined. Accepted values: ia32, intel64"
        goto Help
    endif
endif

if ( ${?CPATH} ) then
    setenv CPATH "${DAALROOT}/include:${CPATH}"
else
    setenv CPATH "${DAALROOT}/include"
endif

if ( ${?LIBRARY_PATH} ) then
    if ( ${?TBBROOT} ) then
        setenv LIBRARY_PATH "${DAALROOT}/lib/${__daal_tmp_target_arch}_fre:${LIBRARY_PATH}"
    else
        setenv LIBRARY_PATH "${DAALROOT}/lib/${__daal_tmp_target_arch}_fre:/usr/local/lib:${LIBRARY_PATH}"
    endif
else
    if ( ${?TBBROOT} ) then
        setenv LIBRARY_PATH "${DAALROOT}/lib/${__daal_tmp_target_arch}_fre"
    else
        setenv LIBRARY_PATH "${DAALROOT}/lib/${__daal_tmp_target_arch}_fre:/usr/local/lib"
    endif
endif

if ( ${?LD_LIBRARY_PATH} ) then
    if ( ${?TBBROOT} ) then
        setenv LD_LIBRARY_PATH "${DAALROOT}/lib/${__daal_tmp_target_arch}_fre:${LD_LIBRARY_PATH}"
    else
        setenv LD_LIBRARY_PATH "${DAALROOT}/lib/${__daal_tmp_target_arch}_fre:/usr/local/lib:${LD_LIBRARY_PATH}"
    endif
else
    if ( ${?TBBROOT} ) then
        setenv LD_LIBRARY_PATH "${DAALROOT}/lib/${__daal_tmp_target_arch}_fre"
    else
        setenv LD_LIBRARY_PATH "${DAALROOT}/lib/${__daal_tmp_target_arch}_fre:/usr/local/lib"
    endif
endif

if ( ${?CLASSPATH} ) then
    setenv CLASSPATH "${DAALROOT}/lib/daal.jar:${CLASSPATH}"
else
    setenv CLASSPATH "${DAALROOT}/lib/daal.jar"
endif

goto End

Help:
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
    exit 1;

End: # Clean up of internal settings
    unset __daal_tmp_target_arch
    unset __daal_tmp_cpro_path
    unset __daal_tmp_script_name
