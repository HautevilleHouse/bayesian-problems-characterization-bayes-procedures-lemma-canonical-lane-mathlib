import BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean.BayesianModel

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean

structure DecisionSpace where
  actions : Type u

structure LossFunction where
  parameter : Parameter
  actions : DecisionSpace
  loss : parameter.carrier → actions.actions → ℝ

structure Risk where
  lossFunction : LossFunction
  decisionRule : (observation : LossFunction.Likelihood.observation) → LossFunction.DecisionSpace.actions
  risk : (parameter : LossFunction.parameter.carrier) → ℝ

structure RiskEvidence (R : Risk) where
  riskDefined : Prop
  riskClosed : R.riskDefined

def RiskClosed (R : Risk) : Prop :=
  R.riskDefined

theorem risk_closed_from_evidence (R : Risk) (E : RiskEvidence R) : RiskClosed R :=
  E.riskClosed

end BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean
end HautevilleHouse