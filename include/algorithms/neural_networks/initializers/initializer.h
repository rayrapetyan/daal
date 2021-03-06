/* file: initializer.h */
/*******************************************************************************
* Copyright 2014-2018 Intel Corporation
* All Rights Reserved.
*
* If this  software was obtained  under the  Intel Simplified  Software License,
* the following terms apply:
*
* The source code,  information  and material  ("Material") contained  herein is
* owned by Intel Corporation or its  suppliers or licensors,  and  title to such
* Material remains with Intel  Corporation or its  suppliers or  licensors.  The
* Material  contains  proprietary  information  of  Intel or  its suppliers  and
* licensors.  The Material is protected by  worldwide copyright  laws and treaty
* provisions.  No part  of  the  Material   may  be  used,  copied,  reproduced,
* modified, published,  uploaded, posted, transmitted,  distributed or disclosed
* in any way without Intel's prior express written permission.  No license under
* any patent,  copyright or other  intellectual property rights  in the Material
* is granted to  or  conferred  upon  you,  either   expressly,  by implication,
* inducement,  estoppel  or  otherwise.  Any  license   under such  intellectual
* property rights must be express and approved by Intel in writing.
*
* Unless otherwise agreed by Intel in writing,  you may not remove or alter this
* notice or  any  other  notice   embedded  in  Materials  by  Intel  or Intel's
* suppliers or licensors in any way.
*
*
* If this  software  was obtained  under the  Apache License,  Version  2.0 (the
* "License"), the following terms apply:
*
* You may  not use this  file except  in compliance  with  the License.  You may
* obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
*
*
* Unless  required  by   applicable  law  or  agreed  to  in  writing,  software
* distributed under the License  is distributed  on an  "AS IS"  BASIS,  WITHOUT
* WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
*
* See the   License  for the   specific  language   governing   permissions  and
* limitations under the License.
*******************************************************************************/

/*
//++
//  Implementation of neural network layer.
//--
*/

#ifndef __INITIALIZERS_H__
#define __INITIALIZERS_H__

#include "algorithms/algorithm.h"
#include "data_management/data/tensor.h"
#include "services/daal_defines.h"
#include "algorithms/neural_networks/initializers/initializer_types.h"

namespace daal
{
namespace algorithms
{
namespace neural_networks
{
namespace initializers
{
/**
 * @ingroup initializers
 * @{
 */
namespace interface1
{
/**
 * <a name="DAAL-CLASS-ALGORITHMS__NEURAL_NETWORKS__INITIALIZERS__INITIALIZERCONTAINERIFACE"></a>
 * \brief Class that specifies interfaces of implementations of the neural network weights and biases initializer
 */
class InitializerContainerIface : public AnalysisContainerIface<batch>
{
public:
    virtual ~InitializerContainerIface()
    {}
};

/**
 * <a name="DAAL-CLASS-ALGORITHMS__NEURAL_NETWORKS__INITIALIZERS__INITIALIZERIFACE"></a>
 *  \brief Class representing a neural network weights and biases initializer
 */
class InitializerIface : public daal::algorithms::Analysis<batch>
{
public:
    typedef algorithms::neural_networks::initializers::Input     InputType;
    typedef algorithms::neural_networks::initializers::Parameter ParameterType;
    typedef algorithms::neural_networks::initializers::Result    ResultType;

    InputType  input;   /*!< Input of the initializer */

    InitializerIface() {}
    InitializerIface(const InitializerIface& other) {}

    virtual ~InitializerIface() {}

    /**
     * Get parameters of the initializer
     * \return Parameters of the initializer
     */
    virtual ParameterType * getParameter() = 0;
};
typedef services::SharedPtr<InitializerIface> InitializerIfacePtr;

} // namespace interface1
using interface1::InitializerContainerIface;
using interface1::InitializerIface;
using interface1::InitializerIfacePtr;
/** @} */
} // namespace initializers
} // namespace neural_networks
} // namespace algorithms
} // namespace daal
#endif
