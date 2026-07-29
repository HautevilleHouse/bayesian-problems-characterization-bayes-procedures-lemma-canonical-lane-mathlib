import BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean.BayesianDecisionModel

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean

structure BayesProcedure {M : BayesianDecisionModel} where
  decisionRule : M.parameterSpace → M.actionSpace
  posteriorExpectedLoss : M.parameterSpace → ℝ
  minimizesPosteriorExpectedLoss : Prop
  decisionRuleClosed : decisionRule = decisionRule
  posteriorExpectedLossClosed : posteriorExpectedLoss = posteriorExpectedLoss
  minimizesPosteriorExpectedLossClosed : minimizesPosteriorExpectedLoss

structure BayesProcedureEvidence {M : BayesianDecisionModel} (B : BayesProcedure M) where
  minimizesPosteriorExpectedLossClosed : B.minimizesPosteriorExpectedLoss

def BayesProcedureClosed {M : BayesianDecisionModel} (B : BayesProcedure M) : Prop :=
  B.minimizesPosteriorExpectedLoss

theorem bayes_procedure_closed_from_evidence {M : BayesianDecisionModel} (B : BayesProcedure M) (E : BayesProcedureEvidence B) :
    BayesProcedureClosed B := by
  exact E.minimizesPosteriorExpectedLossClosed

end BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean
end HautevilleHouse