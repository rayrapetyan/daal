/* file: DistributedPartialResultStep1.java */
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
 * @defgroup implicit_als_training_distributed Distributed
 * @ingroup implicit_als_training
 * @{
 */
/**
 * @brief Contains classes of the implicit ALS training algorithm
 */
package com.intel.daal.algorithms.implicit_als.training;

import com.intel.daal.utils.*;
import com.intel.daal.algorithms.Precision;
import com.intel.daal.data_management.data.NumericTable;
import com.intel.daal.data_management.data.Factory;
import com.intel.daal.services.DaalContext;

/**
 * <a name="DAAL-CLASS-ALGORITHMS__IMPLICIT_ALS__TRAINING__DISTRIBUTEDPARTIALRESULTSTEP1"></a>
 * @brief Provides methods to access partial results obtained with the compute() method of the
 *        implicit ALS training algorithm in the first step of the distributed processing mode
 */
public final class DistributedPartialResultStep1 extends com.intel.daal.algorithms.PartialResult {
    /** @private */
    static {
        LibUtils.loadLibrary();
    }

    /**
     * Constructs a partial result of the implicit ALS training algorithm from the context
     * @param context Context to manage the memory in the native part of the partial result object
     */
    public DistributedPartialResultStep1(DaalContext context) {
        super(context);
        this.cObject = cNewDistributedPartialResultStep1();
    }

    DistributedPartialResultStep1(DaalContext context, long cObject) {
        super(context, cObject);
    }

    /**
     * Returns a partial result of the implicit ALS training algorithm obtained in the first step of the distributed processing mode
     * @param  id   Identifier of the input object, @ref DistributedPartialResultStep1Id
     * @return      Partial result that corresponds to the given identifier
     */
    public NumericTable get(DistributedPartialResultStep1Id id) {
        if (id != DistributedPartialResultStep1Id.outputOfStep1ForStep2) {
            throw new IllegalArgumentException("id unsupported");
        }
        return (NumericTable)Factory.instance().createObject(getContext(), cGetNumericTable(getCObject(), id.getValue()));
    }

    /**
    * Sets a partial result of the implicit ALS training algorithm obtained in the first step of the distributed processing mode
    * @param id     Identifier of the input object
    * @param value  Value of the input object
    */
    public void set(DistributedPartialResultStep1Id id, NumericTable value) {
        if (id != DistributedPartialResultStep1Id.outputOfStep1ForStep2) {
            throw new IllegalArgumentException("id unsupported");
        }
        cSetNumericTable(getCObject(), id.getValue(), value.getCObject());
    }

    private native long cNewDistributedPartialResultStep1();

    private native long cGetNumericTable(long cObject, int id);
    private native void cSetNumericTable(long cObject, int id, long cNumericTable);
}
/** @} */
