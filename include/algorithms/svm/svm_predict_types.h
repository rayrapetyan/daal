/* file: svm_predict_types.h */
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

/*
//++
//  SVM parameter structure
//--
*/

#ifndef __SVM_PREDICT_TYPES_H__
#define __SVM_PREDICT_TYPES_H__

#include "algorithms/classifier/classifier_predict_types.h"
#include "algorithms/svm/svm_model.h"

namespace daal
{
namespace algorithms
{
namespace svm
{
/**
 * @defgroup svm_prediction Prediction
 * \copydoc daal::algorithms::svm::prediction
 * @ingroup svm
 * @{
 */
/**
 * \brief Contains classes to make predictions based on the SVM model
 */
namespace prediction
{
/**
 * <a name="DAAL-ENUM-ALGORITHMS__SVM__PREDICTION__METHOD"></a>
 * Available methods to run predictions based on the SVM model
 */
enum Method
{
    defaultDense = 0          /*!< Default SVM model-based prediction method */
};

/**
 * \brief Contains version 1.0 of the Intel(R) Data Analytics Acceleration Library (Intel(R) DAAL) interface.
 */
namespace interface1
{

/**
 * <a name="DAAL-CLASS-ALGORITHMS__SVM__PREDICTION__INPUT"></a>
 * \brief Input objects in the prediction stage of the svm algorithm
 */
class DAAL_EXPORT Input : public classifier::prediction::Input
{
    typedef classifier::prediction::Input super;
public:
    Input();
    Input(const Input& other);

    virtual ~Input() {}

    using super::get;
    using super::set;

    /**
     * Returns the input Numeric Table object in the prediction stage of the classification algorithm
     * \param[in] id    Identifier of the input NumericTable object
     * \return          %Input object that corresponds to the given identifier
     */
    data_management::NumericTablePtr get(classifier::prediction::NumericTableInputId id) const;

    /**
     * Returns the input Model object in the prediction stage of the SVM algorithm
     * \param[in] id    Identifier of the input Model object
     * \return          %Input object that corresponds to the given identifier
     */
    svm::ModelPtr get(classifier::prediction::ModelInputId id) const;

    /**
     * Sets the input NumericTable object in the prediction stage of the classification algorithm
     * \param[in] id    Identifier of the input object
     * \param[in] ptr   Pointer to the input object
     */
    void set(classifier::prediction::NumericTableInputId id, const data_management::NumericTablePtr &ptr);

    /**
     * Sets the input Model object in the prediction stage of the SVM algorithm
     * \param[in] id    Identifier of the input object
     * \param[in] ptr   Pointer to the input object
     */
    void set(classifier::prediction::ModelInputId id, const svm::ModelPtr &ptr);

    /**
     * Checks the correctness of the input object
     * \param[in] parameter Pointer to the structure of the algorithm parameters
     * \param[in] method    Computation method
     *
     * \return Status of computation
     */
    services::Status check(const daal::algorithms::Parameter *parameter, int method) const DAAL_C11_OVERRIDE;
};

}

using interface1::Input;

} // namespace prediction
/** @} */
} // namespace svm
} // namespace algorithms
} // namespace daal
#endif
