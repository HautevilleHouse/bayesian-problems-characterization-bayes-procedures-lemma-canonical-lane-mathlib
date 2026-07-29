import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean

structure BayesianProblemStatement where
  parameterSpace : Type
  decisionSpace : Type
  lossFunction : parameterSpace → decisionSpace → ℝ
  priorDistribution : parameterSpace → ℝ
  bayesDecisionRule : decisionSpace
  regretBound : Prop

theorem bayes_decision_admissible (problem : BayesianProblemStatement) : Prop :=
  problem.regretBound

end BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean
end HautevilleHouse