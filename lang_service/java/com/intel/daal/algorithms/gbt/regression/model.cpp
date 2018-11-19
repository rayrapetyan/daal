/* file: model.cpp */
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

/* DO NOT EDIT THIS FILE - it is machine generated */
#include <jni.h>

#include "daal.h"
#include "gbt/regression/JModel.h"
#include "common_helpers.h"
#include "common_helpers_functions.h"
#include "../../regression/tree_node_visitor.h"
#include "../../tree_utils/regression/tree_node_visitor.h"
#include "algorithms/gradient_boosted_trees/gbt_regression_model.h"

USING_COMMON_NAMESPACES()
namespace gbtr = daal::algorithms::gbt::regression;

/*
* Class:     com_intel_daal_algorithms_gbt_regression_Model
* Method:    cGetNumberOfTrees
* Signature: (J)J
*/
JNIEXPORT jlong JNICALL Java_com_intel_daal_algorithms_gbt_regression_Model_cGetNumberOfTrees
(JNIEnv *, jobject, jlong modAddr)
{
    return (jlong)(*(gbtr::ModelPtr *)modAddr)->numberOfTrees();
}

/*
* Class:     com_intel_daal_algorithms_gbt_regression_Model
* Method:    cTraverseDF
* Signature: (JJLcom/intel/daal/algorithms/regression/TreeNodeVisitor;)V
*/
JNIEXPORT void JNICALL Java_com_intel_daal_algorithms_gbt_regression_Model_cTraverseDF
(JNIEnv *env, jobject, jlong modAddr, jlong iTree, jobject visitor)
{
    JavaVM *jvm;
    // Get pointer to the Java VM interface function table
    jint status = env->GetJavaVM(&jvm);
    if(status != 0)
        throwError(env, "Couldn't get Java VM interface");
    daal::regression::JavaTreeNodeVisitor visitorImpl(jvm, visitor);
    (*(gbtr::ModelPtr *)modAddr)->traverseDF((size_t)iTree, visitorImpl);
}

/*
* Class:     com_intel_daal_algorithms_gbt_regression_Model
* Method:    cTraverseBF
* Signature: (JJLcom/intel/daal/algorithms/regression/TreeNodeVisitor;)V
*/
JNIEXPORT void JNICALL Java_com_intel_daal_algorithms_gbt_regression_Model_cTraverseBF
(JNIEnv *env, jobject, jlong modAddr, jlong iTree, jobject visitor)
{
    JavaVM *jvm;
    // Get pointer to the Java VM interface function table
    jint status = env->GetJavaVM(&jvm);
    if(status != 0)
        throwError(env, "Couldn't get Java VM interface");
    daal::regression::JavaTreeNodeVisitor visitorImpl(jvm, visitor);
    (*(gbtr::ModelPtr *)modAddr)->traverseBF((size_t)iTree, visitorImpl);
}


/*
* Class:     com_intel_daal_algorithms_gbt_regression_Model
* Method:    cClear
* Signature: (J)V
*/
JNIEXPORT void JNICALL Java_com_intel_daal_algorithms_gbt_regression_Model_cClear
(JNIEnv *, jobject, jlong modAddr)
{
    (*(gbtr::ModelPtr *)modAddr)->clear();
}

/*
* Class:     com_intel_daal_algorithms_gbt_regression_Model
* Method:    cTraverseDFS
* Signature: (JJLcom/intel/daal/algorithms/regression/TreeNodeVisitor;)V
*/
JNIEXPORT void JNICALL Java_com_intel_daal_algorithms_gbt_regression_Model_cTraverseDFS
(JNIEnv *env, jobject, jlong modAddr, jlong iTree, jobject visitor)
{
    JavaVM *jvm;
    // Get pointer to the Java VM interface function table
    jint status = env->GetJavaVM(&jvm);
    if(status != 0)
        throwError(env, "Couldn't get Java VM interface");
    daal::regression::tree_utils::JavaTreeNodeVisitor visitorImpl(jvm, visitor);
    (*(gbtr::ModelPtr *)modAddr)->traverseDFS((size_t)iTree, visitorImpl);
}

/*
* Class:     com_intel_daal_algorithms_gbt_regression_Model
* Method:    cTraverseBFS
* Signature: (JJLcom/intel/daal/algorithms/regression/TreeNodeVisitor;)V
*/
JNIEXPORT void JNICALL Java_com_intel_daal_algorithms_gbt_regression_Model_cTraverseBFS
(JNIEnv *env, jobject, jlong modAddr, jlong iTree, jobject visitor)
{
    JavaVM *jvm;
    // Get pointer to the Java VM interface function table
    jint status = env->GetJavaVM(&jvm);
    if(status != 0)
        throwError(env, "Couldn't get Java VM interface");
    daal::regression::tree_utils::JavaTreeNodeVisitor visitorImpl(jvm, visitor);
    (*(gbtr::ModelPtr *)modAddr)->traverseBFS((size_t)iTree, visitorImpl);
}
