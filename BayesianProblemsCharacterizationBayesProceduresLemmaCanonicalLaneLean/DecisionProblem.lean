import BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean

structure DecisionProblem where
  parameterSpace : Type u
  actionSpace : Type v
  lossFunction : Type w
  priorDist : Type x
  lossFunctionDefined : Prop
  priorDistDefined : Prop

structure DecisionProblemEvidence (D : DecisionProblem) where
  lossFunctionDefinedClosed : D.lossFunctionDefined
  priorDistDefinedClosed : D.priorDistDefined

def DecisionProblemClosed (D : DecisionProblem) : Prop :=
  D.lossFunctionDefined ∧ D.priorDistDefined

theorem decision_problem_closed_from_evidence
    (D : DecisionProblem) (E : DecisionProblemEvidence D) :
    DecisionProblemClosed D := by
  exact And.intro E.lossFunctionDefinedClosed E.priorDistDefinedClosed

end BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean
end HautevilleHouse