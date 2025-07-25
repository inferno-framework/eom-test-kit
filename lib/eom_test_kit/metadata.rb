require_relative 'version'

module EOMTestKit
  class Metadata < Inferno::TestKit
    id :eom_test_kit
    title 'EOM Test Kit'
    description <<~DESCRIPTION
      # Enhancing Oncology Model Inferno Test Kit
      This is an Inferno Test Kit for the Enhancing Oncology Model (EOM) FHIR Implementation Guide. It is designed to test 
      the structure of FHIR resources against the definitions set forth by the IG. 
      <!-- break -->
      
      ## Background
      The Enhancing Oncology Model (EOM) is a Center for Medicare and Medicaid Innovation (CMMI) (Innovation Center) alternative 
      payment model designed to promote high quality, person-centered care, advance health equity, encourage better care coordination, 
      improve access to care, reduce costs, and improve outcomes for Medicare fee-for-service (FFS) beneficiaries with cancer who receive 
      cancer treatment. EOM builds on lessons from the Oncology Care Model (OCM) and shares certain features with OCM, including 
      episode-based payments that financially incentivize physician group practices (PGPs) to improve care and lower costs.
      
      This test kit is built using the [Inferno Framework](https://inferno-framework.github.io/inferno-core/). The Inferno Framework is
      designed for reuse and aims to make it easier to build test kits for any
      FHIR-based data exchange.
      
      ## Status
      
      This test kit provides validation for EOM FHIR resources and bundles.
      
      ## Repository
      
      [EOM Test Kit Repository](https://github.com/inferno-framework/eom-test-kit)
      
      ## Providing Feedback and Reporting Issues
      
      Please report any issues with this set of tests in the [issues section](https://github.com/inferno-framework/eom-test-kit/issues) of the repository.
    DESCRIPTION
    suite_ids [:eom_test_suite]
    tags []
    last_updated LAST_UPDATED
    version VERSION
    maturity 'Low'
    authors ['Leap Orbit']
    repo 'https://github.com/inferno-framework/eom-test-kit'
  end
end
