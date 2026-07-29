import BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean.BayesBridgeGateLemmas

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean

structure BayesDecisionRulePackage where
  decisionRule : BayesAdmittedObject.parameterSpace → BayesAdmittedObject.actionSpace
  riskFunction : BayesAdmittedObject.parameterSpace → ℝ
  bayesRisk : ℝ
  optimalityCondition : Prop
  uniquenessCondition : Prop

structure BayesDecisionRuleEvidence (P : BayesDecisionRulePackage) where
  optimalityConditionClosed : P.optimalityCondition
  uniquenessConditionClosed : P.uniquenessCondition

def BayesDecisionRuleClosed (P : BayesDecisionRulePackage) : Prop :=
  P.optimalityCondition ∧ P.uniquenessCondition

theorem bayes_decision_rule_closed_from_evidence (P : BayesDecisionRulePackage) (E : BayesDecisionRuleEvidence P) :
    BayesDecisionRuleClosed P := by
  exact And.intro E.optimalityConditionClosed E.uniquenessConditionClosed

end BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean
end HautevilleHouse