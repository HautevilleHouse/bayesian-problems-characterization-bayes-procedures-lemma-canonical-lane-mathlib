import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean

structure BayesAdmittedObject where
  parameterSpace : Type
  actionSpace : Type
  priorDistribution : parameterSpace → ℝ
  lossFunction : parameterSpace → actionSpace → ℝ
  bayesRisk : (parameterSpace → actionSpace) → ℝ
  optimalDecisionRule : parameterSpace → actionSpace
  bayesRiskOptimal : Prop
  bayesRiskOptimalProof : bayesRiskOptimal

structure AdmissibleClass where
  object : BayesAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.bayesRiskOptimal ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean
end HautevilleHouse