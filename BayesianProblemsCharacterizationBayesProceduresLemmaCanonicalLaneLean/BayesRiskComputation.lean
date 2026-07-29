import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean

structure BayesRiskPackage (O : BayesianAdmittedObject) (D : DecisionRulePackage O) (P : PriorDistributionPackage O) (L : LossFunctionPackage O) where
  bayesRisk : ℝ
  bayesRiskFinite : Prop
  bayesRiskComputed : bayesRisk = ∫ θ, (L.loss (θ, D.decisionRule θ)) * (P.priorDensity θ) ∂ volume
  posteriorRisk : O.parameterSpace → ℝ
  posteriorRiskFinite : Prop
  posteriorRiskFormula : ∀ x : O.actionSpace, posteriorRisk x = ∫ θ, L.loss (θ, x) * P.priorDensity θ ∂ volume

structure BayesRiskEvidence (O : BayesianAdmittedObject) (D : DecisionRulePackage O) (P : PriorDistributionPackage O) (L : LossFunctionPackage O) (B : BayesRiskPackage O D P L) where
  bayesRiskFiniteClosed : B.bayesRiskFinite
  posteriorRiskFiniteClosed : B.posteriorRiskFinite
  bayesRiskFormulaClosed : B.bayesRiskComputed
  posteriorRiskFormulaClosed : B.posteriorRiskFormula

def BayesRiskClosed (O : BayesianAdmittedObject) (D : DecisionRulePackage O) (P : PriorDistributionPackage O) (L : LossFunctionPackage O) (B : BayesRiskPackage O D P L) : Prop :=
  B.bayesRiskFinite ∧ B.posteriorRiskFinite ∧ B.bayesRiskComputed ∧ B.posteriorRiskFormula

theorem bayes_risk_closed_from_evidence (O : BayesianAdmittedObject) (D : DecisionRulePackage O) (P : PriorDistributionPackage O) (L : LossFunctionPackage O) (B : BayesRiskPackage O D P L) (E : BayesRiskEvidence O D P L B) : BayesRiskClosed O D P L B :=
  And.intro E.bayesRiskFiniteClosed (And.intro E.posteriorRiskFiniteClosed (And.intro E.bayesRiskFormulaClosed E.posteriorRiskFormulaClosed))

end BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean
end HautevilleHouse