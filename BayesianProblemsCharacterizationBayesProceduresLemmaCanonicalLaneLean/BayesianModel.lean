import BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean

structure Parameter where
  carrier : Type u

data Distribution (α : Type u) : Type u where
  mk : (α → ℝ) → Distribution α

structure Prior where
  parameter : Parameter
  distribution : Distribution parameter.carrier

structure Likelihood where
  observation : Type u
  givenParameter : Parameter
  conditionalDistribution : observation → Distribution (givenParameter.carrier)

structure Posterior where
  prior : Prior
  likelihood : Likelihood
  posteriorDistribution : (observation : Likelihood.observation) → Distribution (Parameter.carrier)

structure PosteriorEvidence (P : Posterior) where
  posteriorDefined : Prop
  posteriorClosed : P.posteriorDefined

end BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean
end HautevilleHouse