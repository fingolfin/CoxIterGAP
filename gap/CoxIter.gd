#
# CoxIter: Computation of invariants of hyperbolic Coxeter groups
#
# Declarations
#

CoxIterFamily := NewFamily("CoxIterFamily");

DeclareCategory( "IsCoxIter", IsObject );

#! @Arguments CoxIter object
#! @Returns 1 (cofinite), 0 (not cofinite), -1 (cannot decide)
#! @Description
#! Test whether the group is cofinite or not.
DeclareAttribute( "Cofinite", IsCoxIter );

#! @Arguments CoxIter object
#! @Returns 1 (cocompact), 0 (not cocompact), -1 (cannot decide)
#! @Description
#! Test whether the group is cocompact or not.
DeclareAttribute( "Cocompact", IsCoxIter );

#! @Arguments CoxIter object
#! @Returns the Euler characteristic
#! @Description
#! Compute the Euler characteristic
DeclareAttribute( "EulerCharacteristic", IsCoxIter );

#! @Arguments CoxIter object
#! @Returns the f-vector of the associated polyhedron
#! @Description
#! Compute the f-vector of the associated polyhedron
DeclareAttribute( "FVector", IsCoxIter );

#! @Arguments CoxIter object
#! @Returns [f,g] where f/g is the rational expansion of the growth series
#! @Description
#! Compute the rational expansion of the growth series
DeclareAttribute( "GrowthSeries", IsCoxIter );

IsCoxIterRep := NewRepresentation("IsCoxIter", IsObject and IsComponentObjectRep and IsAttributeStoringRep, [ "iCoxeterMatrix", "iDimension", "bInvariantsComputed", "iCofinite", "iCocompact", "iFVector", "rEulerCharacteristic", "pGrowthSeries" ]);

CoxIterType := NewType( CoxIterFamily, IsCoxIter and IsCoxIterRep and IsAttributeStoringRep );

#! @Arguments gr, dimension
#! @Returns a CoxIter object
#! @Label CreateCoxIterFromCoxeterGraph
#! @Description
#! Creates a CoxIter object from the Coxeter graph <A>gr</A>. If the dimension <A>dim</A> is unknown, 0 can be given.
DeclareOperation( "CreateCoxIterFromCoxeterGraph", [ IsList, IsInt ] );

#! @Arguments mat, dimension
#! @Returns a CoxIter object
#! @Description
#!  Creates a CoxIter object from the Coxeter matrix <A>mat</A>. If the dimension <A>dim</A> is unknown, 0 can be given.
DeclareOperation( "CreateCoxIterFromCoxeterMatrix", [ IsMatrix, IsInt ] );

#! @Arguments ci
#! @Description
#!  Compute the invariants of the Coxiter object <A>ci</A>
DeclareOperation( "CoxIterCompute", [ IsCoxIter ] );

DeclareGlobalVariable( "_CoxIter_MAXSIZES", "Maximum: weight for an edge, index for a vertex, dimension" );
