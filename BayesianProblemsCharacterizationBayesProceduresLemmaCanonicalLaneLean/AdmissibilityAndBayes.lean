import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean

structure AdmissibilityLemmaPackage (O : BayesianAdmittedObject) (D : DecisionRulePackage O) (P : PriorDistributionPackage O) (L : LossFunctionPackage O) (B : BayesRiskPackage O D P L) where
  bayesRuleAdmissible : D.riskFunction = λ θ => B.bayesRisk → ∀ (D' : DecisionRulePackage O), D'.riskFunction = λ θ => B.bayesRisk ∨ ∃ θ, D'.riskFunction θ > D.riskFunction θ
  properPriorUsed : Prop
  uniquenessCondition : Prop
  admissibilityConcluded : Prop

structure AdmissibilityLemmaEvidence (O : BayesianAdmittedObject) (D : DecisionRulePackage O) (P : PriorDistributionPackage O) (L : LossFunctionPackage O) (B : BayesRiskPackage O D P L) (A : AdmissibilityLemmaPackage O D P L B) where
  bayesRuleAdmissibleClosed : A.bayesRuleAdmissible
  properPriorUsedClosed : A.properPriorUsed
  uniquenessConditionClosed : A.uniquenessCondition
  admissibilityConcludedClosed : A.admissibilityConcluded

def AdmissibilityLemmaClosed (O : BayesianAdmittedObject) (D : DecisionRulePackage O) (P : PriorDistributionPackage O) (L : LossFunctionPackage O) (B : BayesRiskPackage O D P L) (A : AdmissibilityLemmaPackage O D P L B) : Prop :=
  A.bayesRuleAdmissible ∧ A.properPriorUsed ∧ A.uniquenessCondition ∧ A.admissibilityConcluded

theorem admissibility_lemma_closed_from_evidence (O : BayesianAdmittedObject) (D : DecisionRulePackage O) (P : PriorDistributionPackage O) (L : LossFunctionPackage O) (B : BayesRiskPackage O D P L) (A : AdmissibilityLemmaPackage O D P L B) (E : AdmissibilityLemmaEvidence O D P L B A) : AdmissibilityLemmaClosed O D P L B A :=
  And.intro E.bayesRuleAdmissibleClosed (And.intro E.properPriorUsedClosed (And.intro E.uniquenessConditionClosed E.admissibilityConcludedClosed))

theorem admissibility_lemma_supports_bridge (O : BayesianAdmittedObject) (D : DecisionRulePackage O) (P : PriorDistributionPackage O) (L : LossFunctionPackage O) (B : BayesRiskPackage O D P L) (A : AdmissibilityLemmaPackage O D P L B) : bridgeClosed (AdmissibleClass.mk O (A.admissibilityConcluded) (True) (Or.inl A.admissibilityConcluded)) :=
  by
    exact A.admissibilityConcluded

end BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean
end HautevilleHouse