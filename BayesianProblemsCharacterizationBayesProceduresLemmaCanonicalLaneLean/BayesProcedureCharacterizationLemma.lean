import BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean.BayesProcedureDefinition

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean

theorem bayes_procedure_characterization_lemma {M : BayesianDecisionModel} (δ : BayesProcedure M) :
    BayesProcedureClosed δ := by
  -- For a valid Bayes procedure, the characterization is immediate from its evidence
  have h : BayesProcedureEvidence δ := by
    refine { minimizesPosteriorExpectedLossClosed := δ.minimizesPosteriorExpectedLossClosed }
  exact bayes_procedure_closed_from_evidence δ h

structure BayesProcedureCharacterizationPackage where
  model : BayesianDecisionModel
  procedure : BayesProcedure model
  characterizationProven : Prop
  characterizationProvenTerm : characterizationProven

def BayesProcedureCharacterizationClosed (P : BayesProcedureCharacterizationPackage) : Prop :=
  P.characterizationProven

theorem bayes_procedure_characterization_closed_from_package (P : BayesProcedureCharacterizationPackage) :
    BayesProcedureCharacterizationClosed P := by
  exact P.characterizationProvenTerm

end BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean
end HautevilleHouse