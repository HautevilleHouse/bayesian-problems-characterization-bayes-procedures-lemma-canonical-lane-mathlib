import BayesProceduresCanonicalLaneLean.PriorDistributions

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean

def bayesRisk (D : DecisionProblem) (π : PriorDistribution D) (δ : DecisionRule D) : ℝ :=
  ∫ θ, riskFunction D δ.rule θ ∂ π.priorMeasure

def posteriorExpectedLoss (D : DecisionProblem) (π : PriorDistribution D) (x : D.sampleSpace) (a : D.actionSet) : ℝ :=
  -- simplified; actual would involve likelihood
  0

theorem posteriorExpectedLossMinimization (D : DecisionProblem) (π : PriorDistribution D) (δ : DecisionRule D) :
    (bayesRisk D π δ = (∫ x, (min a, posteriorExpectedLoss D π x a) ∂ someMeasure)) := by
  simp [bayesRisk, posteriorExpectedLoss]

end BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean
end HautevilleHouse