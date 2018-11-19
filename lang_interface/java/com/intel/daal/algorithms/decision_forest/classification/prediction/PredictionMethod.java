/* file: PredictionMethod.java */
/*******************************************************************************
* Copyright 2014-2018 Intel Corporation.
*
* This software and the related documents are Intel copyrighted  materials,  and
* your use of  them is  governed by the  express license  under which  they were
* provided to you (License).  Unless the License provides otherwise, you may not
* use, modify, copy, publish, distribute,  disclose or transmit this software or
* the related documents without Intel's prior written permission.
*
* This software and the related documents  are provided as  is,  with no express
* or implied  warranties,  other  than those  that are  expressly stated  in the
* License.
*******************************************************************************/

/**
 * @ingroup decision_forest_classification_prediction
 * @{
 */
package com.intel.daal.algorithms.decision_forest.classification.prediction;

/**
 * <a name="DAAL-CLASS-ALGORITHMS__DECISION_FOREST__CLASSIFICATION__PREDICTION__PREDICTIONMETHOD"></a>
 * @brief Available methods for predictions based on the decision forest classification model
 */
public final class PredictionMethod {

    private int _value;

    /**
     * Constructs the prediction method object using the provided value
     * @param value     Value corresponding to the prediction method object
     */
    public PredictionMethod(int value) {
        _value = value;
    }

    /**
     * Returns the value corresponding to the prediction method object
     * @return Value corresponding to the prediction method object
     */
    public int getValue() {
        return _value;
    }

    private static final int defaultDenseId = 0;

    public static final PredictionMethod defaultDense = new PredictionMethod(defaultDenseId); /*!< Default method */
}
/** @} */
