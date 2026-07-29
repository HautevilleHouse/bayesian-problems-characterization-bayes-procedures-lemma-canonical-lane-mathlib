import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean

structure DecisionRulePackage (O : BayesianAdmittedObject) where
  decisionRule : O.parameterSpace → O.actionSpace
  riskFunction : O.parameterSpace → ℝ
  riskFunctionIntegrable : Prop

structure PriorDistributionPackage (O : BayesianAdmittedObject) where
  priorDensity : O.parameterSpace → ℝ
  priorIntegrable : Prop
  priorIntegralOne : Prop

structure LossFunctionPackage (O : BayesianAdmittedObject) where
  loss : O.parameterSpace × O.actionSpace → ℝ
  lossBounded : Prop

structure DecisionProblemEvidence (O : BayesianAdmittedObject) (D : DecisionRulePackage O) (P : PriorDistributionPackage O) (L : LossFunctionPackage O) where
  bayesRiskDefined : Prop
  posteriorRiskDefined : Prop
  bayesRuleExists : Prop

def DecisionProblemClosed (O : BayesianAdmittedObject) (D : DecisionRulePackage O) (P : PriorDistributionPackage O) (L : LossFunctionPackage O) : Prop :=
  D.riskFunctionIntegrable ∧ P.priorIntegrable ∧ P.priorIntegralOne ∧ L.lossBounded

theorem decision_problem_closed_from_evidence (O : BayesianAdmittedObject) (D : DecisionRulePackage O) (P : PriorDistributionPackage O) (L : LossFunctionPackage O) (E : DecisionProblemEvidence O D P L) : DecisionProblemClosed O D P L :=
  And.intro E.bayesRiskDefined (And.intro E.posteriorRiskDefined (And.intro E.bayesRuleExists (by exact L.lossBounded)))

end BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean
end HautevilleHouse