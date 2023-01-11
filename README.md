The GAP 4 package `CoxIter'
==============================

Installation
---------------------------------
CoxIter need to be compiled.

If a terminal is opened inside your GAP folder, this can be achieved with the following commands (on Linux, OSX):

	cd pkg/
	git clone https://github.com/rgugliel/CoxIterGAP
	cd CoxIterGAP
	./configure PATH_TO_YOUR_GAP
	make

Giving a hyperbolic Coxeter group
---------------------------------
In order to specify a Coxeter group, one can describe its Coxeter graph: we create a list containing the neighbours of every vertex, together with the weights.
For example, a description of the group F_4 would be the following:

`
[[1,[2,3]],[2,[3,4]],[3,[4,3]]]
`

And for the group D_4:

`
[[1,[2,3]],[2,[3,3],[4,3]]]
`

**Remark**
A weight 0 corresponds do a bold line in the graph (parallel hyperplanes) and a weight 1 corresponds to a dotted line (ultra-parallel hyperplanes). 

A first example
-----------------
To create a CoxIter object from a graph, we use the CreateCoxIterFromCoxeterGraph function. The first parameters is a list describing the graph and the second is the dimension of the space (0 can be specified if we don't know the dimension):
For example, the cocompact hyperbolic Coxeter group in dimension 8 can be described as follows:

	LoadPackage("coxiter");
	cibugaenko8 := CreateCoxIterFromCoxeterGraph([[1,[2,5]],[2,[3,3]],[3,[4,3]],[4,[5,3],[10,3]],[5,[6,3]],[6,[7,3],[11,3]],[7,[8,3]],[8,[9,5]],[10,[11,1]]],8);

The following information are then available:
* FVector : vector
* Cocompact : 1 (yes), 0 (no), -1 (unable to decide)
* Cofinite : 1 (yes), 0 (no), -1 (unable to decide)
* EulerCharacteristic : rational fraction
* GrowthSeries : list [f,g] of numerator and denominator of the rational function

With our example, we get:

	gap> FVector(cibugaenko8);
	[ 41, 164, 316, 374, 294, 156, 54, 11, 1 ]
	gap> Cocompact(cibugaenko8);
	1
	gap> Cofinite(cibugaenko8);
	1
	gap> EulerCharacteristic(cibugaenko8);
	24187/8709120000
	gap> g := GrowthSeries(cibugaenko8);;
	gap> Value(g[2],1)/Value(g[1],1) - EulerCharacteristic(cibugaenko8);
	0

