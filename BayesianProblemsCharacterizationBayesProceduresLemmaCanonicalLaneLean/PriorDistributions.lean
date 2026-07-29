import BayesProceduresCanonicalLaneLean.DecisionTheory

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean

structure PriorDistribution (D : DecisionProblem) where
  parameterSigmaAlgebra : Set (Set D.parameterSet)
  priorMeasure : MeasureTheory.Measure D.parameterSet
  proper : priorMeasure D.parameterSet = 1

structure ImproperPrior (D : DecisionProblem) where
  priorMeasure : MeasureTheory.Measure D.parameterSet
  proper : priorMeasure D.parameterSet = ∞

structure PriorFamily (D : DecisionProblem) where
  priors : Set (PriorDistribution D)
  convex : Set.Convex priors

end BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean
end HautevilleHouse