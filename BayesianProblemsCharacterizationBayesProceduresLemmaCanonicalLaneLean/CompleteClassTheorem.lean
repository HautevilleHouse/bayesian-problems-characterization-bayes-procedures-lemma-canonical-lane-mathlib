import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean

structure CompleteClassPackage (O : BayesianAdmittedObject) (D : DecisionRulePackage O) (P : PriorDistributionPackage O) (L : LossFunctionPackage O) (B : BayesRiskPackage O D P L) where
  admissibleRulesAreBayes : ∀ (D' : DecisionRulePackage O), (∀ θ, D'.riskFunction θ ≤ D.riskFunction θ) → (∃ (P' : PriorDistributionPackage O), D' is Bayes w.r.t. P')
  bayesRulesAdmissible : Prop
  completeClassConcluded : Prop

structure CompleteClassEvidence (O : BayesianAdmittedObject) (D : DecisionRulePackage O) (P : PriorDistributionPackage O) (L : LossFunctionPackage O) (B : BayesRiskPackage O D P L) (C : CompleteClassPackage O D P L B) where
  admissibleRulesAreBayesClosed : C.admissibleRulesAreBayes
  bayesRulesAdmissibleClosed : C.bayesRulesAdmissible
  completeClassConcludedClosed : C.completeClassConcluded

def CompleteClassClosed (O : BayesianAdmittedObject) (D : DecisionRulePackage O) (P : PriorDistributionPackage O) (L : LossFunctionPackage O) (B : BayesRiskPackage O D P L) (C : CompleteClassPackage O D P L B) : Prop :=
  C.admissibleRulesAreBayes ∧ C.bayesRulesAdmissible ∧ C.completeClassConcluded

theorem complete_class_closed_from_evidence (O : BayesianAdmittedObject) (D : DecisionRulePackage O) (P : PriorDistributionPackage O) (L : LossFunctionPackage O) (B : BayesRiskPackage O D P L) (C : CompleteClassPackage O D P L B) (E : CompleteClassEvidence O D P L B C) : CompleteClassClosed O D P L B C :=
  And.intro E.admissibleRulesAreBayesClosed (And.intro E.bayesRulesAdmissibleClosed E.completeClassConcludedClosed)

theorem complete_class_supports_gate (O : BayesianAdmittedObject) (D : DecisionRulePackage O) (P : PriorDistributionPackage O) (L : LossFunctionPackage O) (B : BayesRiskPackage O D P L) (C : CompleteClassPackage O D P L B) : gateClosed (AdmissibleClass.mk O (C.completeClassConcluded) (True) (Or.inl C.completeClassConcluded)) :=
  by
    exact Or.inl C.completeClassConcluded

end BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean
end HautevilleHouse