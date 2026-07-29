import BayesProceduresCanonicalLaneLean.BayesRisk

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean

structure BayesProcedure (D : DecisionProblem) (π : PriorDistribution D) where
  rule : DecisionRule D
  minimizesBayesRisk : ∀ (δ' : DecisionRule D), bayesRisk D π rule ≤ bayesRisk D π δ'

def admissibleProcedures (D : DecisionProblem) : Set (DecisionRule D) := { δ | ∀ δ', (∀ θ, riskFunction D δ'.rule θ ≤ riskFunction D δ.rule θ) → (∀ θ, riskFunction D δ'.rule θ = riskFunction D δ.rule θ) }

structure BayesProceduresLemma (D : DecisionProblem) (π : PriorDistribution D) where
  bayesProcedure : BayesProcedure D π
  admissible : BayesProcedure D π ∈ admissibleProcedures D

theorem bayes_procedures_characterization (D : DecisionProblem) (π : PriorDistribution D) (δ : DecisionRule D) :
    (BayesProcedure D π).rule = δ → (δ ∈ admissibleProcedures D) := by
  intro h
  -- proof sketch
  exact h

end BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean
end HautevilleHouse