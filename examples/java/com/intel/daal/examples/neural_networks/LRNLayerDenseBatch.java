/* file: LRNLayerDenseBatch.java */
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
 //  Content:
 //     Java example of local response normalization layer in the batch processing mode
 ////////////////////////////////////////////////////////////////////////////////
 */

package com.intel.daal.examples.neural_networks;

import com.intel.daal.algorithms.neural_networks.layers.lrn.*;
import com.intel.daal.algorithms.neural_networks.layers.ForwardResultId;
import com.intel.daal.algorithms.neural_networks.layers.ForwardResultLayerDataId;
import com.intel.daal.algorithms.neural_networks.layers.ForwardInputId;
import com.intel.daal.algorithms.neural_networks.layers.BackwardResultId;
import com.intel.daal.algorithms.neural_networks.layers.BackwardInputId;
import com.intel.daal.algorithms.neural_networks.layers.BackwardInputLayerDataId;
import com.intel.daal.data_management.data.Tensor;
import com.intel.daal.data_management.data.HomogenTensor;
import com.intel.daal.examples.utils.Service;
import com.intel.daal.services.DaalContext;

/**
 * <a name="DAAL-EXAMPLE-JAVA-LRNLAYERBATCH">
 * @example LRNLayerDenseBatch.java
 */
class LRNLayerDenseBatch {
    private static final String datasetFileName = "../data/batch/layer.csv";
    private static DaalContext context = new DaalContext();

    public static void main(String[] args) throws java.io.FileNotFoundException, java.io.IOException {
        /* Read datasetFileName from a file and create a tensor to store forward input data */
        Tensor data    = Service.readTensorFromCSV(context, datasetFileName);
        Service.printTensor("LRN layer input (first 5 rows):",data, 5, 0);
        /* Create an algorithm to compute forward local response normalization layer results using default method */
        LrnForwardBatch lrnLayerForward = new LrnForwardBatch(context, Float.class, LrnMethod.defaultDense);

        /* Set input objects for the forward local response normalization layer */
        lrnLayerForward.input.set(ForwardInputId.data, data);

        /* Compute forward local response normalization layer results */
        LrnForwardResult forwardResult = lrnLayerForward.compute();

        /* Print the results of the forward local response normalization layer */
        Service.printTensor("LRN layer result (first 5 rows):",
                            forwardResult.get(ForwardResultId.value), 5, 0);
        //Service.printTensor("LRN layer auxSmBeta (first 5 rows):",
         //                   forwardResult.get(LrnLayerDataId.auxSmBeta), 5, 0);

        /* Get the size of forward local response normalization layer output */
        int nSize = (int)forwardResult.get(ForwardResultId.value).getSize();
        long[] dims = forwardResult.get(ForwardResultId.value).getDimensions();

        /* Create a tensor with backward input data */
        double[] backData = new double[nSize];
        Tensor tensorDataBack = new HomogenTensor(context, dims, backData, 0.01);

        /* Create an algorithm to compute backward local response normalization layer results using default method */
        LrnBackwardBatch lrnLayerBackward = new LrnBackwardBatch(context, Float.class, LrnMethod.defaultDense);

        /* Set input objects for the backward local response normalization layer */
        lrnLayerBackward.input.set(BackwardInputId.inputGradient, tensorDataBack);
        lrnLayerBackward.input.set(BackwardInputLayerDataId.inputFromForward, forwardResult.get(ForwardResultLayerDataId.resultForBackward));

        /* Compute backward local response normalization layer results */
        LrnBackwardResult backwardResult = lrnLayerBackward.compute();

        /* Print the results of the backward local response normalization layer */
        Service.printTensor("LRN layer backpropagation result (first 5 rows):",
                            backwardResult.get(BackwardResultId.gradient), 5, 0);
        context.dispose();
    }
}
