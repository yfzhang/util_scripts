## error ocurred
usr/include/eigen3/Eigen/src/Core/AssignEvaluator.h:745:3: error: static assertion failed:YOU_MIXED_DIFFERENT_NUMERIC_TYPES__YOU_NEED_TO_USE_THE_CAST_METHOD_OF_MATRIXBASE_TO_CAST_NUMERIC_TYPES_EXPLICITLY
　　EIGEN_CHECK_BINARY_COMPATIBILIY(Func,typename ActualDstTypeCleaned::Scalar,typename Src::Scalar);

## solution
- this error is due to a Eigen3 bug.

- open Thirdparty/g2o/g2o/solver/linear_solver_eigen.h

original code
'''
template <typename MatrixType>
class LinearSolverEigen: public LinearSolver<MatrixType>
{
  public:
    typedef Eigen::SparseMatrix<double, Eigen::ColMajor> SparseMatrix;
    typedef Eigen::Triplet<double> Triplet;
    typedef Eigen::PermutationMatrix<Eigen::Dynamic, Eigen::Dynamic, SparseMatrix::Index> PermutationMatrix;
'''

make following changes
'''
template <typename MatrixType>
class LinearSolverEigen: public LinearSolver<MatrixType>
{
  public:
    typedef Eigen::SparseMatrix<double, Eigen::ColMajor> SparseMatrix;
    typedef Eigen::Triplet<double> Triplet;
    typedef Eigen::PermutationMatrix<Eigen::Dynamic, Eigen::Dynamic, int> PermutationMatrix;
'''


