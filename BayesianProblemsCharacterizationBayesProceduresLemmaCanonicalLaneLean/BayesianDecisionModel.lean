import BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean.BayesianAdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean

structure BayesianDecisionModel where
  parameterSpace : Type u
  actionSpace : Type v
  prior : parameterSpace → ℝ
  likelihood : parameterSpace → actionSpace → ℝ
  loss : parameterSpace → actionSpace → ℝ
  priorPositive : ∀ θ, prior θ > 0
  likelihoodNonnegative : ∀ θ a, likelihood θ a ≥ 0
  lossNonnegative : ∀ θ a, loss θ a ≥ 0

structure BayesianDecisionModelEvidence (M : BayesianDecisionModel) where
  priorPositiveClosed : M.priorPositive
  likelihoodNonnegativeClosed : M.likelihoodNonnegative
  lossNonnegativeClosed : M.lossNonnegative

def BayesianDecisionModelClosed (M : BayesianDecisionModel) : Prop :=
  M.priorPositive ∧ M.likelihoodNonnegative ∧ M.lossNonnegative

theorem bayesian_decision_model_closed_from_evidence (M : BayesianDecisionModel) (E : BayesianDecisionModelEvidence M) :
    BayesianDecisionModelClosed M := by
  exact And.intro E.priorPositiveClosed (And.intro E.likelihoodNonnegativeClosed E.lossNonnegativeClosed)

end BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean
end HautevilleHouse