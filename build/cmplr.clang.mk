# file: cmplt.clang.mk
#================================================== -*- makefile -*- vim:ft=make
# Copyright 2012-2018 Intel Corporation
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

#++
#  Clang defenitions for makefile
#--

PLATs.clang = mac32e mac32 fbsd32e fbsd32

CMPLRDIRSUFF.clang = _clang

CORE.SERV.COMPILER.clang = generic

-Zl.clang = $(if $(OS_is_win),-Zl,)
-DEBC.clang = -g

COMPILER.lnx.clang = clang++ -D__int64="long long" -D__int32="int" $(if $(IA_is_ia32),-m32,-m64) -fgnu-runtime -Wno-inconsistent-missing-override -stdlib=libstdc++ -nostdinc++
COMPILER.mac.clang = clang++ -D__int64="long long" -D__int32="int" $(if $(IA_is_ia32),-m32,-m64) -fgnu-runtime -stdlib=libstdc++ -mmacosx-version-min=10.11
COMPILER.fbsd.clang = clang++ -D__int64="long long" -D__int32="int" $(if $(IA_is_ia32),-m32,-m64) -I/usr/include/c++/v1 -I/usr/local/include

link.dynamic.lnx.clang = clang++ $(if $(IA_is_ia32),-m32,-m64)
link.dynamic.mac.clang = clang++ $(if $(IA_is_ia32),-m32,-m64)
link.dynamic.fbsd.clang = clang++ $(if $(IA_is_ia32),-m32,-m64)

p4_OPT.clang   = $(-Q)$(if $(OS_is_mac),$(if $(IA_is_ia32),march=nocona,march=core2),$(if $(IA_is_ia32),march=pentium4,march=nocona))
mc_OPT.clang   = $(-Q)$(if $(PLAT_is_mac32),march=nocona,march=core2)
mc3_OPT.clang  = $(-Q)march=corei7
avx_OPT.clang  = $(-Q)march=corei7-avx
avx2_OPT.clang = $(if $(OS_is_mac),$(-Q)march=corei7-avx,$(-Q)march=haswell)
knl_OPT.clang  = $(if $(OS_is_mac),$(-Q)march=corei7-avx,$(-Q)march=knl)
skx_OPT.clang  = $(if $(OS_is_mac),$(-Q)march=corei7-avx,$(-Q)march=skylake)
