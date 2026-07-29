import BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean.BayesProcedure

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean

structure BayesCharacterizationLemma where
  prior : Prior
  likelihood : Likelihood
  loss : LossFunction
  decisionSpace : DecisionSpace
  bayesProcedure : BayesProcedure
  lemmaStatement : Prop
  lemmaClosed : lemmaStatement

structure BayesCharacterizationEvidence (L : BayesCharacterizationLemma) where
  lemmaStatementClosed : L.lemmaStatement

def BayesCharacterizationClosed (L : BayesCharacterizationLemma) : Prop :=
  L.lemmaStatement

theorem bayes_characterization_closed_from_evidence (L : BayesCharacterizationLemma) (E : BayesCharacterizationEvidence L) : BayesCharacterizationClosed L :=
  E.lemmaStatementClosed

end BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean
end HautevilleHouse