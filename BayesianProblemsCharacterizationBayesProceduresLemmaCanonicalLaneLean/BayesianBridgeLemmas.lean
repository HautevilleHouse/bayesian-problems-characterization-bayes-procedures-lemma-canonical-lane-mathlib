import BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean.BayesianAdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean

def bridgeClosed (A : BayesianAdmissibleClass) : Prop :=
  BayesWitnessClosed A.object

theorem bridge_from_admissible_class (A : BayesianAdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end BayesianProblemsCharacterizationBayesProceduresLemmaCanonicalLaneLean
end HautevilleHouse