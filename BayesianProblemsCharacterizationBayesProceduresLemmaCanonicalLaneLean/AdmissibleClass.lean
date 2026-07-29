import BayesProceduresCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean

structure AdmissibleClass where
  object : BayesianAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  BayesWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean
end HautevilleHouse