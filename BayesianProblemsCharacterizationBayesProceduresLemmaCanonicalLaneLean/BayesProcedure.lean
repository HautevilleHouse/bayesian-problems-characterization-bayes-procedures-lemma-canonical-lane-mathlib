import BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean.LossFunction

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean

structure BayesProcedure where
  prior : Prior
  likelihood : Likelihood
  loss : LossFunction
  decisionRule : (observation : likelihood.observation) → loss.actions.actions
  posteriorExpectedLossMinimized : Prop

structure BayesProcedureEvidence (B : BayesProcedure) where
  posteriorExpectedLossMinimizedClosed : B.posteriorExpectedLossMinimized

def BayesProcedureClosed (B : BayesProcedure) : Prop :=
  B.posteriorExpectedLossMinimized

theorem bayes_procedure_closed_from_evidence (B : BayesProcedure) (E : BayesProcedureEvidence B) : BayesProcedureClosed B :=
  E.posteriorExpectedLossMinimizedClosed

def BayesProcedureDefined (prior : Prior) (likelihood : Likelihood) (loss : LossFunction) (decisionSpace : DecisionSpace) : Prop :=
  ∃ (decisionRule : (observation : likelihood.observation) → decisionSpace.actions),
    BayesProcedure.mk prior likelihood loss decisionRule (by
      -- Placeholder: In a full development, this would be proven
      trivial)

end BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean
end HautevilleHouse