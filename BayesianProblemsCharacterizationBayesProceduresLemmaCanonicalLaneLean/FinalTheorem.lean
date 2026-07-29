import BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean.BayesBridgeGateLemmas

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean

def ConstrainedBayesProceduresClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem bayes_procedures_endgame (A : AdmissibleClass) : ConstrainedBayesProceduresClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean
end HautevilleHouse