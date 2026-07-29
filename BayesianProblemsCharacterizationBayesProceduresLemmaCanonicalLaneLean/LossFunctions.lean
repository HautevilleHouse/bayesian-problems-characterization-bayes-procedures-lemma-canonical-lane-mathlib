import BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean.DecisionProblem

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean

structure LossFunctionPackage (D : DecisionProblem) where
  riskFunction : Type u
  bayesRisk : Type v
  riskComputable : Prop
  bayesRiskFinite : Prop

structure LossFunctionEvidence {D : DecisionProblem} (L : LossFunctionPackage D) where
  riskComputableClosed : L.riskComputable
  bayesRiskFiniteClosed : L.bayesRiskFinite

def LossFunctionClosed {D : DecisionProblem} (L : LossFunctionPackage D) : Prop :=
  L.riskComputable ∧ L.bayesRiskFinite

theorem loss_function_closed_from_evidence
    {D : DecisionProblem} (L : LossFunctionPackage D) (E : LossFunctionEvidence L) :
    LossFunctionClosed L := by
  exact And.intro E.riskComputableClosed E.bayesRiskFiniteClosed

end BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean
end HautevilleHouse