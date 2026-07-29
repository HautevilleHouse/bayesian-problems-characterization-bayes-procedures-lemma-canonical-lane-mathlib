import BayesProceduresCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean

structure DecisionProblem where
  parameterSet : Type u
  actionSet : Type v
  lossFunction : parameterSet → actionSet → ℝ
  observationModel : Type w
  sampleSpace : Type x

def riskFunction (D : DecisionProblem) (rule : D.parameterSet → D.actionSet) (θ : D.parameterSet) : ℝ :=
  D.lossFunction θ (rule θ)

structure DecisionRule (D : DecisionProblem) where
  rule : D.parameterSet → D.actionSet
  measurable : Prop

end BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean
end HautevilleHouse