import BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean.BayesianBridgeLemmas
import BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean.BayesProcedureCharacterizationLemma

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean

def ConstrainedBayesClosure (A : BayesianAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_bayes_endgame (A : BayesianAdmissibleClass) :
    ConstrainedBayesClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean
end HautevilleHouse